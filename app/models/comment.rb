class Comment < ApplicationRecord

  belongs_to :post, dependent: :destroy
  belongs_to :user, dependent: :destroy
  
  def author?(cur_user)
    cur_user == self.user
  end
end
