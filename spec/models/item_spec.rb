require 'rails_helper'

RSpec.describe Item, type: :model do
  describe "Constraints" do
    before do
      # Stub callback method
      allow_any_instance_of(Channel).to receive(:rss_worker_start).and_return(true)
    end
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
