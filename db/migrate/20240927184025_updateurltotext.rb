class Updateurltotext < ActiveRecord::Migration[7.1]
  def change
    change_column :images, :url, :text
  end
end
