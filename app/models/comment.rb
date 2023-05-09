class Comment < ApplicationRecord

  belongs_to :post, dependent: :destroy
  belongs_to :user, dependent: :destroy

  validates :body, presence:true
  include Visible 
end
