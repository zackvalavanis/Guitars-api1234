class CreateImages < ActiveRecord::Migration[7.1]
  def change
    create_table :images do |t|
      t.string :url
      t.integer :guitar_id

      t.timestamps
    end
  end
end
