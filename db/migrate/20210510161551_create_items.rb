class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.integer :channel_id
      t.string :guid
      t.string :title
      t.string :link
      t.text :description
      t.datetime :pub_date

      t.timestamps
    end
  end
end
