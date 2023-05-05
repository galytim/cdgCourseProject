class Comment < ApplicationRecord

  belongs_to :post, dependent: :destroy
  belongs_to :user, dependent: :destroy

  validates :body, presence:true

  def author?(cur_user)
    cur_user == self.user
  end
end
