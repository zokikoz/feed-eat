class Channel < ApplicationRecord
  has_many :items, dependent: :destroy

  after_create :rss_worker_start
  after_update :rss_worker_start

  def rss_worker_start
    RssWorker.perform_async
  end
end
