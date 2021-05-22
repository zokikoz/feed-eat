require 'rails_helper'
require 'sidekiq/testing'
require 'webmock/rspec'

Sidekiq::Testing.inline!

RSpec.describe RssWorker, type: :worker do
  before(:each) do
    # Stub callback method
    allow_any_instance_of(Channel).to receive(:rss_worker_start).and_return(true)
  end

  describe "Invalid feed" do
    before { FactoryBot.build(:channel, link: 'http://www.example.com').save(validate: false) }
    it "is not parsed and log error" do
      expect(Sidekiq.logger).to receive(:error).with(/Feed parsing error/)
      RssWorker.perform_async
    end
  end

  describe "Invalid updating content" do
    it "is log error" do
      expect(Sidekiq.logger).to receive(:error).with(/Update error/)
      worker = RssWorker.new
      worker.send(:item_update, nil, nil)
    end
  end

  describe "Valid RSS feed content" do
    before { FactoryBot.create(:channel) }
    it "is load all RSS entries to items table" do
      expect { RssWorker.perform_async }.to change { Item.count }.by(10)
    end
  end

  describe "Valid Atom feed content" do
    before { FactoryBot.create(:channel, link: 'https://weblog.rubyonrails.org/feed/atom.xml') }
    it "is load all Atom entries to items table" do
      expect { RssWorker.perform_async }.to change { Item.count }.by(10)
    end
  end

  describe "Invalid RSS feed content" do
    before { FactoryBot.create(:channel, link: 'https://www.ruby-lang.org/en/feeds/wrong.rss') }
    it "is not load RSS entries without guid and pubDate" do
      expect { RssWorker.perform_async }.to change { Item.count }.by(7)
    end
  end

  describe "Invalid Atom feed content" do
    before { FactoryBot.create(:channel, link: 'https://weblog.rubyonrails.org/feed/wrong.xml') }
    it "is not load Atom entries with empty id" do
      expect { RssWorker.perform_async }.to change { Item.count }.by(9)
    end
  end
end
