require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    it 'nameとemail、passwordとpassword_confirmationが存在すれば登録できること' do
      user = build(:user)
      expect(user).to be_valid
    end

    it 'nameが空では登録できないこと' do
      user = build(:user, name: nil)
      user.valid?
      expect(user.errors[:name]).to include("を入力してください")
    end

    it 'emailが空では登録できないこと' do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it 'passwordが空では登録できないこと' do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    it 'passwordが存在してもpassword_confirmationが空では登録できないこと' do
      user = build(:user, password_confirmation: '')
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end

    it 'nameが9文字以上であれば登録できないこと' do
      user = build(:user, name: 'aaaaaaaaa')
      user.valid?
      expect(user.errors[:name]).to include("は8文字以内で入力してください")
    end

    it 'nameが8文字以下では登録できること' do
      user = build(:user, name: 'aaaaaaaa')
      expect(user).to be_valid
    end

    it "重複したemailが存在する場合登録できないこと" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end

    it "passwordが6文字以上であれば登録できること" do
      user = build(:user, password: "000000", password_confirmation: "000000")
     user.valid?
     expect(user).to be_valid
    end

    it "passwordが5文字以下であれば登録できないこと" do
      user = build(:user, password: "00000", password_confirmation: "00000")
     user.valid?
     expect(user.errors[:password]).to include("は6文字以上で入力してください")
    end

  end
end
