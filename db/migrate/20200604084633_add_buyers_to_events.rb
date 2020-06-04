class AddBuyersToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :buyers, :integer
  end
end
