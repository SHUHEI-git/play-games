require 'rails_helper'

describe CommentsController do
  let(:user) { create(:user) }
  let(:post) { create(:post, user: user) }

  describe '#create' do
    context 'パラメータが揃っている場合' do
      it '正常に登録できること' do
        comment = build(:comment, text: 'おはよう', post: post)
        expect { comment.save }.to change { post.comments.count }.by(1)
      end
    end

    context 'パラメータが揃っていない場合' do
      it '登録できないこと' do
        comment = build(:comment, text: '', post: post)
        expect { comment.save }.to change { post.comments.count }.by(0)
      end
    end
  end
end