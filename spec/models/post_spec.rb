require 'rails_helper'

RSpec.describe Post, type: :model do
  describe '#create' do
    context '保存できる場合' do
      it 'title, body, invitation, imageが存在すれば保存できること' do
        post = build(:post)
        expect(post).to be_valid
      end

      it 'titleが50文字以下だと保存できること' do
        characters = 'a' * 50
        post = build(:post, title: characters)
        expect(post).to be_valid
      end

      it 'bodyが1000文字以下だと保存できること' do
        characters = 'a' * 1000
        post = build(:post, body: characters)
        expect(post).to be_valid
      end
    end

    context '保存できない場合' do
      it 'titleが空では保存できないこと' do
        post = build(:post, title: nil)
        post.valid?
        expect(post.errors[:title]).to include('を入力してください')
      end

      it 'titleが51文字以上だと保存できないこと' do
        characters = 'a' * 51
        post = build(:post, title: characters)
        post.valid?
        expect(post.errors[:title]).to include('は50文字以内で入力してください')
      end

      it 'bodyが空では保存できないこと' do
        post = build(:post, body: nil)
        post.valid?
        expect(post.errors[:body]).to include('を入力してください')
      end

      it 'bodyが1001文字以上だと保存できないこと' do
        characters = 'a' * 1001
        post = build(:post, body: characters)
        post.valid?
        expect(post.errors[:body]).to include('は1000文字以内で入力してください')
      end
    end
  end
end
