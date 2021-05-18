class RssWorker
  include Sidekiq::Worker

  def perform
    Channel.all.each do |channel|
      feed = feed_connect(channel.link)
      selected_items = feed_select(feed)
      items_update(selected_items, channel)
    end
  end

  private

  # Feed connector
  def feed_connect(link)
    logger.info "Connecting #{link}"
    feed_url = URI.parse(link)
    RSS::Parser.parse(feed_url)
  rescue StandardError => e
    logger.error "Feed connection error: #{e.message}"
  end

  # Getting entries from feed
  def feed_select(feed)
    selected_items = []
    case feed.feed_type
    when 'rss'
      items = feed.channel.items
      items.each do |item|
        selected_items.push(rss_select(item))
      end
    when 'atom'
      items = feed.entries
      items.each do |item|
        selected_items.push(atom_select(item))
      end
    end
    selected_items
  end

  def rss_select(item)
    item_hash = item.as_json
    { guid: item_hash.dig('guid', 'content'),
      title: item_hash['title'],
      description: item_hash['description'],
      link: item_hash['link'],
      pub_date: item_hash['pubDate'] }
  end

  def atom_select(item)
    item_hash = item.as_json
    { guid: item_hash.dig('id', 'content'),
      title: item_hash.dig('title', 'content'),
      description: item_hash.dig('content', 'content'),
      link: item_hash.dig('link', 'href'),
      pub_date: item_hash.dig('updated', 'content') }
  end

  # Updating items table
  def items_update(selected_items, channel)
    selected_items.each do |item|
      next if item[:guid].nil? || item[:pub_date].nil?

      item[:pub_date] = item[:pub_date].to_datetime
      updated_item = channel.items.where(guid: item[:guid]).first_or_initialize
      updated_item.update(title: item[:title], description: item[:description], link: item[:link], pub_date: item[:pub_date])
    end
  rescue StandardError => e
    logger.error "Update error: #{e.message}"
  end
end
