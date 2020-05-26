class AddDefaultValueToActiveInShops < ActiveRecord::Migration[6.0]
  def change
    change_column :shops, :active, :boolean, default: true
  end
end
