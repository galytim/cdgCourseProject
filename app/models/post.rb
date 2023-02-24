class Post < ApplicationRecord

    include ImageUploader::Attachment(:image)
    include Visible
    belongs_to :user
    has_many :comments, dependent: :destroy

    validates :image, presence: true
    validates :body, presence: true, length: { minimum: 5 }

  end