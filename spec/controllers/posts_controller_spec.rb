require 'rails_helper'

describe PostsController, type: :controller do
  describe 'GET #index' do
    it '投稿が新着順に表示されること' do
      posts = create_list(:post, 3)
      get :index
      expect(assigns(:posts)).to match(posts.sort{ |a, b| b.created_at <=> a.created_at } )
    end

    it "index.html.erbに遷移すること" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    it 'リクエストされたpostのパラメータが@postに割り当てられていること' do
      post = create(:post)
      get :show, params: { id: post }
      expect(assigns(:post)).to eq post
    end
    
    it 'show.html.erbに遷移すること' do
      post = create(:post)
      get :show, params: { id: post }
      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do
    it "new.html.erbに遷移すること" do
      user = create(:user)
      sign_in user
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    it 'リクエストされたpostのパラメータが@postに割り当てられていること' do
      post = create(:post)
      get :edit, params: { id: post }
      expect(assigns(:post)).to eq post
    end

    it 'edit.html.erbに遷移すること' do
      user = create(:user)
      sign_in user
      post = create(:post, user_id: user.id)
      get :edit, params: { id: post }
      expect(response).to render_template :edit
    end
  end
end