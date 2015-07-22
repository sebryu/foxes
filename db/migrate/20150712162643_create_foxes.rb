class CreateFoxes < ActiveRecord::Migration
  def change
    create_table :foxes do |t|
      t.string :name
      t.string :age
      t.string :color

      t.timestamps null: false
    end
  end
end
