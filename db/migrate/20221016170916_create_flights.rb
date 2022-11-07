class CreateFlights < ActiveRecord::Migration[7.0]
  def change
    create_table :flights do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :avatar
      t.float :price

      t.timestamps
    end
  end
end
