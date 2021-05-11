require 'rails_helper'

RSpec.describe "channels/edit", type: :view do
  before(:each) do
    Channel.delete_all
    @channel = assign(:channel, Channel.create!(
      link: "https://www.ruby-lang.org/en/feeds/news.rss"
    ))
  end

  it "renders the edit channel form" do
    render

    assert_select "form[action=?][method=?]", channel_path(@channel), "post" do

      assert_select "input[name=?]", "channel[link]"
    end
  end
end
