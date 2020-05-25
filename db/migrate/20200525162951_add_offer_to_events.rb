class AddOfferToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :offer, :string
  end
end
