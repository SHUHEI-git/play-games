require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe '#create' do
    context '保存できる場合' do
      it 'textが存在すれば保存できること' do
        comment = build(:comment)
        expect(comment).to be_valid
      end
    end

    context '保存できない場合' do
      it 'textが空では保存できないこと' do
        comment = build(:comment, text: nil)
        comment.valid?
        expect(comment.errors[:text]).to include('を入力してください')
      end

      it 'titleが151文字以上だと保存できないこと' do
        characters = 'a' * 151
        comment = build(:comment, text: characters)
        comment.valid?
        expect(comment.errors[:text]).to include('は150文字以内で入力してください')
      end
    end
  end
end
