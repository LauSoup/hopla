class AddDefaultValueToActiveInEvents < ActiveRecord::Migration[6.0]
  def change
    change_column :events, :active, :boolean, default: true
  end
end
