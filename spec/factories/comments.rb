# t.integer "user_id"
# t.integer "post_id"
# t.text "text", null: false
# t.datetime "created_at", null: false
# t.datetime "updated_at", null: false

FactoryBot.define do
  factory :comment do
    text { "テストテスト" }
    user
    post
  end
end
