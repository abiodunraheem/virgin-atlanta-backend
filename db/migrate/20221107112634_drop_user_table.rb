class DropUserTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :users
  end
end
Virgin Atlanta is a responsive app that allows users book flight, lists flight reservations or cancel flight. A user can selects a specific flight, see the details page with its full description, and can click the "Reserve" button to reserve it. The user can also access the "Reserve" page from the navigation panel, add or delete a reservation

