require 'rails_helper'

RSpec.describe Item, type: :model do
  subject { described_class.new(link: nil) }

  describe "Associations" do
    it { should belong_to(:channel) }
  end

  describe "Uniqueness" do
    subject { FactoryBot.build(:item) }
    it { should validate_uniqueness_of(:guid) }
  end
end
