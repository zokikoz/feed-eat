require 'rails_helper'

RSpec.describe Channel, type: :model do
  it "is not valid without a link" do
    channel = Channel.new(link: nil)
    expect(channel).to_not be_valid
  end

  it "is not valid with bad URL" do
    channel = Channel.new(link: 'http://')
    expect(channel).to_not be_valid
  end

  it "is valid with good URL" do
    channel = Channel.new(link: 'https://www.ruby-lang.org/en/feeds/news.rss')
    expect(channel).to be_valid
  end
end
