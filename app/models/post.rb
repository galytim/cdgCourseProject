class Post < ApplicationRecord

    include ImageUploader::Attachment(:image)
    include Visible 
    belongs_to :user
    has_many :comments, dependent: :delete_all
    has_and_belongs_to_many :liked_users, class_name: "User", join_table: "likes"

    validates :image, presence: true
    validates :body, presence: true
  end