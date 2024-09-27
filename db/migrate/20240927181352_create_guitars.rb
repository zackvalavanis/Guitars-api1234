class CreateGuitars < ActiveRecord::Migration[7.1]
  def change
    create_table :guitars do |t|
      t.string :name
      t.string :price

      t.timestamps
    end
  end
end
