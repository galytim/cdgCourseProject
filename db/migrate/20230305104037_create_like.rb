class CreateLike < ActiveRecord::Migration[7.0]
  def change
    create_table "likes", force: :cascade do |t|
      t.bigint "post_id", null: false
      t.bigint "user_id", null: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["post_id"], name: "index_likes_on_post_id"
      t.index ["user_id"], name: "index_likes_on_user_id"
    end
    end
  end
