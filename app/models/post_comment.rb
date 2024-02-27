class PostComment < ApplicationRecord

#post_commentから見たuserとpost_imageを紐づける記述
 belongs_to :user
 belongs_to :post_image
end
