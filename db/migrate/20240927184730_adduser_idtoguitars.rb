class AdduserIdtoguitars < ActiveRecord::Migration[7.1]
  def change
    add_column :guitars, :user_id, :integer
  end
end
