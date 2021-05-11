require 'rails_helper'

RSpec.describe "channels/show", type: :view do
  before(:each) do
    @channel = assign(:channel, Channel.create!(
      link: "https://www.ruby-lang.org"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Link/)
  end
end
