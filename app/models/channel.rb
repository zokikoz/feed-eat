class Channel < ApplicationRecord
  has_many :items, dependent: :destroy
end
