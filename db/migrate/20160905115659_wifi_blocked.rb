class WifiBlocked < ActiveRecord::Migration
  def change
  	add_column :wifis , :blocked , :boolean , default: false
  end
end
