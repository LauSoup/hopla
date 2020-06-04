class AddDefaultToBuyersInEvents < ActiveRecord::Migration[6.0]
  def change
    change_column :events, :buyers, :integer, default: 0
  end
end
