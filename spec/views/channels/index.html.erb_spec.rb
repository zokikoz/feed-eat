require 'rails_helper'

RSpec.describe "channels/index", type: :view do
  before(:each) do
    assign(:channels, [Channel.create!(link: "https://www.ruby-lang.org/en/feeds/news.rss"),
                       Channel.create!(link: "https://www.ruby-lang.org/en/feeds/news.rss")])
  end

  it "renders a list of channels" do
    render
    assert_select "tr>td", text: "https://www.ruby-lang.org/en/feeds/news.rss".to_s, count: 2
  end
end
