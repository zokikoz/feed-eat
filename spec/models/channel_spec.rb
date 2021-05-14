require 'rails_helper'

RSpec.describe Channel, type: :model do
  subject { described_class.new(link: nil) }

  describe "Associations" do
    it { should have_many(:items) }
  end

  describe "Uniqueness" do
    it { should validate_uniqueness_of(:link) }
  end

  it "is not valid without a link" do
    expect(subject).to_not be_valid
  end

  # Checking validator with shoulda matchers
  describe "HTML link" do
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
end
