require 'rails_helper'

RSpec.describe "channels/show", type: :view do
  before(:each) do
    Channel.delete_all
    @channel = assign(:channel, Channel.create!(
      link: "https://www.ruby-lang.org/en/feeds/news.rss"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Link/)
  end
end
