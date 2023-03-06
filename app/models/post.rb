class Post < ApplicationRecord

    include ImageUploader::Attachment(:image)
    include Visible
    belongs_to :user
    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy

    validates :image, presence: true
    validates :body, presence: true, length: { minimum: 5 }

    def liked?(user)
      like = Like.where(user_id: user.id, post_id: self.id).exists?
    end
  end