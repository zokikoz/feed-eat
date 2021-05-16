require 'rails_helper'

RSpec.describe Item, type: :model do
  it "is not valid without a guid" do
    subject { described_class.new(guid: nil) }
    expect(subject).to_not be_valid
  end

  describe "Associations" do
    it { should belong_to(:channel) }
  end

  describe "Uniqueness" do
    subject { FactoryBot.build(:item) }
    it { should validate_uniqueness_of(:guid) }
  end
end
