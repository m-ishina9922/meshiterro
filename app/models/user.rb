class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
 #userから見たpost_imageを紐づける記述
  has_many :post_images, dependent: :destroy
  #userから見たpost_commentを紐づける記述
  has_many :post_comments, dependent: :destroy

  has_many :favorites, dependent: :destroy

  #プロフィール画像を扱えるようにする記述
  has_one_attached :profile_image

 def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/sample-author1.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [100, 100]).processed
 end
end
