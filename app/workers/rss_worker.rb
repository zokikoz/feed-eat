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
    { guid: item.try(:guid).try(:content),
      title: item.title,
      description: item.description,
      link: item.link,
      pub_date: item.pubDate }
  end

  def atom_select(item)
    { guid: item.try(:id).try(:content),
      title: item.try(:title).try(:content),
      description: item.try(:content).try(:content),
      link: item.try(:link).try(:href),
      pub_date: item.try(:updated).try(:content) }
  end

  # Updating items table
  def items_update(selected_items, channel)
    selected_items.each do |item|
      next if item[:guid].blank? || item[:pub_date].blank? 

      updated_item = channel.items.where(guid: item[:guid]).first_or_initialize
      updated_item.update(title: item[:title], description: item[:description], link: item[:link], pub_date: item[:pub_date])
    end
  rescue StandardError => e
    logger.error "Update error: #{e.message}"
  end
end
