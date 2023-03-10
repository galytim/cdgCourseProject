class CreateLike < ActiveRecord::Migration[7.0]
  def change
    create_table "likes", id: false do |t|
      t.belongs_to :user
      t.belongs_to :post
      t.index ["post_id","user_id"], :unique => true
    end
    end
  end
