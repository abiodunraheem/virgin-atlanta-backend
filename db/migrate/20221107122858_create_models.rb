class CreateModels < ActiveRecord::Migration[7.0]
  def change
    create_table :models do |t|
      t.string :user
      t.string :fullname
      t.string :username
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
