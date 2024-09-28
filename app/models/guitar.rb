class Guitar < ApplicationRecord
  has_many :images
  belongs_to :users


  def images_with_default 
    if images.length > 0 
      return images
    else 
      return [
        {id: 100, url: "https://cdn1.iconfinder.com/data/icons/media-player-icons-1/48/icon_random-512.png", guitar_id: 500, created_at: Time.now, updated_at: Time.now}
      ]
    end 
  end 
end
