class RssWorker
  include Sidekiq::Worker

  def perform
    Channel.all.each do |channel|
      Rails.logger.info "Updating #{channel.link}"
      URI.parse(channel.link).open do |rss|
        feed = RSS::Parser.parse(rss)
        # Content based parser
        case feed.feed_type
        when 'rss'
          rss_update(feed.channel.items, channel)
        when 'atom'
          atom_update(feed.entries, channel)
        end
      end
    end
  end

  private

  def rss_update(items, channel)
    items.each do |item|
      selected_item = channel.items.where(guid: item.guid.content).first_or_initialize
      selected_item.update(title: item.title, description: item.description, link: item.link, pub_date: item.pubDate.rfc2822)
    end
  end

  def atom_update(entries, channel)
    entries.each do |item|
      selected_item = channel.items.where(guid: item.id.content).first_or_initialize
      selected_item.update(title: item.title.content, description: item.content.content, link: item.link.href, pub_date: item.updated.content.rfc2822)
    end
  end
end
