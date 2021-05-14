require 'rails_helper'

RSpec.describe "items/index", type: :view do
  before(:each) do
    FactoryBot.create(:channel)
    @items = build_list(:item, 2)
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Ruby 3.0.1 Released/)
  end
end
