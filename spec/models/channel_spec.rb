require 'rails_helper'

RSpec.describe Channel, type: :model do
  describe "Associations" do
    it { should have_many(:items) }
  end

  describe "Uniqueness" do
    subject { FactoryBot.build(:channel) }
    it { should validate_uniqueness_of(:link).ignoring_case_sensitivity }
  end

  describe "Presence" do
    it { should validate_presence_of(:link) }
  end

  # Checking validator with shoulda matchers
  describe "RSS feed" do
    it { should_not allow_value("http://www.example.com").for(:link) }
  end

  # Checking validator by error response
  it "is not valid without RSS/Atom feed" do
    subject.link = 'http://www.example.com'
    subject.validate
    expect(subject.errors[:link]).to include("is invalid RSS format")
  end

  # Checking validator using array of values
  wrong_urls = %w[http://www.example.com http:fake ruby.rss]
  wrong_urls.each do |url|
    it "is not valid with bad URL" do
      subject.link = url
      expect(subject).to_not be_valid
    end
  end

  good_urls = %w[https://weblog.rubyonrails.org/feed/atom.xml https://www.ruby-lang.org/en/feeds/news.rss]
  good_urls.each do |url|
    it "is valid with good URL" do
      subject.link = url
      expect(subject).to be_valid
    end
  end

  describe "Callbacks" do
    subject { FactoryBot.build(:channel) }
    it "should start RSS worker after create" do
      expect(subject).to receive(:rss_worker_start)
      subject.run_callbacks(:create)
    end
  end
end
