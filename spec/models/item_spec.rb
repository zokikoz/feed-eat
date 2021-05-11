require 'rails_helper'

RSpec.describe Item, type: :model do
  subject { described_class.new(link: nil) }

  describe "Associations" do
    it { should belong_to(:channel) }
  end
end
