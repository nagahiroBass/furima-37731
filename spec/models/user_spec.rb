require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'user registration' do
    context '新規登録できるとき' do
      it '新規登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規投稿できないとき' do
    end
  end
end

