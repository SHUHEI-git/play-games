require 'rails_helper'

describe PostsController do
  describe 'GET #index' do
    it '投稿が新着順に表示されること' do
      posts = create_list(:post, 3, :with_images)
      get :index
      expect(assigns(:posts)).to match(posts.sort{ |a, b| b.created_at <=> a.created_at } )
    end
  end
end