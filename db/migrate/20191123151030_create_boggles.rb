class CreateBoggles < ActiveRecord::Migration[5.2]
  def change
    create_table :boggles do |t|
      t.string :name
      t.string :board
      t.integer :row
      t.integer :col

      t.timestamps
    end
  end
end
