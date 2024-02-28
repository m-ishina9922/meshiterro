class PostImage < ApplicationRecord

  has_one_attached :image

  #post_imageから見たuserを紐づける記述
  belongs_to :user

  #post_imageから見たpost_commentを紐づける記述
  has_many :post_comments, dependent: :destroy

  #post_imageから見たfavoriteを紐づける記述
  has_many :favorites, dependent: :destroy

  validates :shop_name, presence: true
  validates :image, presence: true


  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: file.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
end
