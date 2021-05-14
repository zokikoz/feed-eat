require 'rails_helper'

RSpec.describe "channels/index", type: :view do
  before(:each) do
    assign(:channels, [Channel.create!(link: "https://www.ruby-lang.org/en/feeds/news.rss"),
                       Channel.create!(link: "https://weblog.rubyonrails.org/feed/atom.xml")])
  end

  it "renders a list of channels" do
    render
    assert_select "tr>td", text: "https://www.ruby-lang.org/en/feeds/news.rss".to_s
    assert_select "tr>td", text: "https://weblog.rubyonrails.org/feed/atom.xml".to_s
  end
end
