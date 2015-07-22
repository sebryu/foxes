class AddUsersToFoxes < ActiveRecord::Migration
  def change
    add_reference :foxes, :user, index: true, foreign_key: true
  end
end
