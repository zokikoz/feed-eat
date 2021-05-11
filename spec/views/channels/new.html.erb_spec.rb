require 'rails_helper'

RSpec.describe "channels/new", type: :view do
  before(:each) do
    assign(:channel, Channel.new(
      link: "https://www.ruby-lang.org"
    ))
  end

  it "renders new channel form" do
    render

    assert_select "form[action=?][method=?]", channels_path, "post" do

      assert_select "input[name=?]", "channel[link]"
    end
  end
end
