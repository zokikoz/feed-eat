# Validates RSS feed
class RssValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    feed_url = URI.parse(value)
    RSS::Parser.parse(feed_url)
  rescue RSS::Error
    record.errors.add(attribute, 'is invalid RSS format')
  rescue StandardError => e
    record.logger.error "RSS link error: #{e.message}"
    record.errors.add(attribute, 'can\'t be connected')
  end
end
