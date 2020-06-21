# t.string "email", default: "", null: false
# t.string "encrypted_password", default: "", null: false
# t.string "reset_password_token"
# t.datetime "reset_password_sent_at"
# t.datetime "remember_created_at"
# t.datetime "created_at", null: false
# t.datetime "updated_at", null: false
# t.string "name"
# t.string "friend_code"
# t.string "image"
# t.index ["email"], name: "index_users_on_email", unique: true
# t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

FactoryBot.define do
  factory :user do
    name                  {"abe"}
    email                 {"kkk@gmail.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
    friend_code           {"123456789"}
  end
end
