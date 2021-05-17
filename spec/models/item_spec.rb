require 'rails_helper'

RSpec.describe Item, type: :model do
  describe "Constraints" do
    it "is not valid with null guid" do
      expect { FactoryBot.create(:item, guid: nil) }.to raise_error(ActiveRecord::NotNullViolation)
    end
  end

  describe "Associations" do
    it { should belong_to(:channel) }
  end

  describe "Uniqueness" do
    subject { FactoryBot.build(:item) }
    it { should validate_uniqueness_of(:guid) }
  end
end
