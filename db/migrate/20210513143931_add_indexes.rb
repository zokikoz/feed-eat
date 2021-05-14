class AddIndexes < ActiveRecord::Migration[6.1]
  def change
    add_index :items, :channel_id
    add_index :items, :pub_date
    add_index :items, :guid, unique: true
    
    add_index :channels, :link, unique: true
  end
end
