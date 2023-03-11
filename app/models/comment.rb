class Comment < ApplicationRecord
  include Visible
  belongs_to :post, dependent: :destroy
  belongs_to :user, dependent: :destroy

end
