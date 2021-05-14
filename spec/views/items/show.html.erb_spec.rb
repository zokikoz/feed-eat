require 'rails_helper'

RSpec.describe "items/show", type: :view do
  before(:each) do
    @item = build(:item)
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Please check the topics below/)
  end
end
