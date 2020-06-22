require 'rails_helper'

feature 'post', type: :feature do
  let(:user) { create(:user) }

  scenario 'ユーザー情報が更新されていること' do
    # ログイン前には投稿ボタンがない
    visit root_path
    expect(page).to have_no_content('新規投稿')

    # ログイン処理
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    find('input[value="ログイン"]').click
    expect(current_path).to eq root_path
    expect(page).to have_content('新規投稿')

    # 募集の投稿
    expect {
      click_link('新規投稿')
      expect(current_path).to eq new_post_path
      fill_in 'post_title', with: 'テトリス'
      fill_in 'content-box--text', with: '対戦相手募集'
      fill_in 'post_invitation', with: '123456789'
      find('input[value="投稿"]').click
    }.to change(Post, :count).by(1)
  end
end