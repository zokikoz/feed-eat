require 'rails_helper'

RSpec.describe "channels/index", type: :view do
  before(:each) do
    assign(:channels, [
      Channel.create!(
        link: "Link"
      ),
      Channel.create!(
        link: "Link"
      )
    ])
  end

  it "renders a list of channels" do
    render
    assert_select "tr>td", text: "Link".to_s, count: 2
  end
end
