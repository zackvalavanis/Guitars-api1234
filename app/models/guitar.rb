class Guitar < ApplicationRecord
  has_many :images
  belongs_to :users
end
