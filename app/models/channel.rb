class Channel < ApplicationRecord
  # URL_REGEXP = %r{(http|https)://[a-z0-9]+([\-.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(/.*)?\z}ix
  # URL_REGEXP = %r{\A(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w\.-]*)*\/?\Z}i
  validates :link, presence: true
  validate :active_feed

  has_many :items, dependent: :destroy

  after_create :rss_worker_start

  def rss_worker_start
    RssWorker.perform_async
  end

  def active_feed
    feed_url = URI.parse(link)
    RSS::Parser.parse(feed_url)
  rescue RSS::Error
    errors.add(:link, 'is invalid RSS format')
  rescue StandardError => e
    logger.error "RSS link error: #{e.message}"
    errors.add(:link, 'can\'t be connected')
  end
end
