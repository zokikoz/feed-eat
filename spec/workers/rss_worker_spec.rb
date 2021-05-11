require 'rails_helper'
require 'sidekiq/testing'
Sidekiq::Testing.inline!

RSpec.describe RssWorker, type: :worker do
  before(:each) do
    Channel.delete_all
    Channel.create!(link: 'https://www.ruby-lang.org/en/feeds/news.rss')
  end
  it "is load entries to items table" do
    Item.delete_all
    expect { RssWorker.perform_async }.to change { Item.count }.from(0)
  end
end
