class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|

      t.timestamps
      t.references :customer
      t.references :item
      t.string :name
      t.string :postal_code
      t.string :address
      t.text :introduction
      t.integer :price
      t.boolean :is_active, default: true
    end
  end
end
