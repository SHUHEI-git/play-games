# t.string "title", null: false
# t.text "body"
# t.string "invitation"
# t.string "image"
# t.datetime "created_at", null: false
# t.datetime "updated_at", null: false
# t.integer "user_id"
# t.index ["title", "body"], name: "index_posts_on_title_and_body", length: 32


FactoryBot.define do
  factory :post do
    title { 'hello!' }
    body { 'hello!募集中' }
    invitation { '12345678' }
    created_at { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
    updated_at { '2016-01-02T00:00:00Z' }
    # image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/text_image.jpg')) }
    user_id { 1 }
    user
  end
end
