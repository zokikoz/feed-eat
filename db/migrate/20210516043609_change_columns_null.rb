class ChangeColumnsNull < ActiveRecord::Migration[6.1]
  def change
    change_column_null :channels, :link, false
    change_column_null :items, :guid, false
  end
end
