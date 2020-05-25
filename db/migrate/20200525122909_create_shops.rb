class CreateShops < ActiveRecord::Migration[6.0]
  def change
    create_table :shops do |t|
      t.boolean :active
      t.string :name
      t.string :address
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
