class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.datetime :beg_date
      t.datetime :end_date
      t.string :category
      t.string :qr_code
      t.references :shop, null: false, foreign_key: true

      t.timestamps
    end
  end
end
