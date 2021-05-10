class Channel < ApplicationRecord
  URL_REGEXP = %r{(http|https)://[a-z0-9]+([\-.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(/.*)?\z}ix
  validates :link, presence: true, format: { with: URL_REGEXP, message: 'You provided invalid URL' }

  has_many :items, dependent: :destroy

  after_create :rss_worker_start
  after_update :rss_worker_start

  def rss_worker_start
    RssWorker.perform_async
  end
end
