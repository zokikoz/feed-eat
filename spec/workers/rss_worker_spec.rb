require 'rails_helper'
require 'sidekiq/testing'
require 'webmock/rspec'

Sidekiq::Testing.inline!

RSpec.describe RssWorker, type: :worker do
  describe "Valid RSS feed" do
    before { FactoryBot.create(:channel) }
    it "is load all RSS entries to items table" do
      expect { RssWorker.perform_async }.to change { Item.count }.by(10)
    end
  end

  describe "Valid Atom feed" do
    before { FactoryBot.create(:channel, link: 'https://weblog.rubyonrails.org/feed/atom.xml') }
    it "is load all Atom entries to items table" do
      expect { RssWorker.perform_async }.to change { Item.count }.by(10)
    end
  end

  describe "Invalid RSS feed" do
    before { FactoryBot.create(:channel, link: 'https://www.ruby-lang.org/en/feeds/wrong.rss') }
    it "is not load RSS entries without guid and pubDate" do
      expect { RssWorker.perform_async }.to change { Item.count }.by(7)
    end
  end

  describe "Invalid Atom feed" do
    before { FactoryBot.create(:channel, link: 'https://weblog.rubyonrails.org/feed/wrong.xml') }
    it "is not load Atom entries with empty id" do
      expect { RssWorker.perform_async }.to change { Item.count }.by(9)
    end
  end
end
