class Favorite < ApplicationRecord

  #favoriteから見たuserを紐づける記述
  belongs_to :user
  #favoriteから見たpost_imageを紐づける記述
  belongs_to :post_image

  validates :user_id, uniqueness: {scope: :post_image_id}
end
