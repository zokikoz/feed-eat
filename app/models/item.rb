class Item < ApplicationRecord
  belongs_to :channel
  validates :guid, uniqueness: true
end
