class AddActiveToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :active, :boolean
  end
end
