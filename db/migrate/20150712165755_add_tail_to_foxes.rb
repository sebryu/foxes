class AddTailToFoxes < ActiveRecord::Migration
  def change
    add_column :foxes, :tail, :string
  end
end
