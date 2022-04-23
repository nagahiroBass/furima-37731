require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'user registration' do
    context 'should be valid' do
      it 'should be valid' do
        expect(@user).to be_valid
      end
    end

    context 'should not be valid' do
      context 'user information' do
        it 'nickname should be present' do
        end
        it 'email should be present' do
        end
        it 'email should be unique' do
        end
        it 'email should have @' do
        end
        it 'password should be present' do
        end
        it 'password should be more than 6 characters' do
        end
        it 'password should be a mixture of singlebyte alphanumeric characters' do
        end
        it 'password should be  same to password_confirmation' do
        end
      end
      context 'identification information' do
        it 'firstname should be present' do
        end
        it 'lastname should be present' do
        end
        it 'firstname_read should be present' do
        end
        it 'lastname_read should be present' do
        end
        it 'firstname should be double-byte character' do
        end
        it 'lastname should be double-byte character' do
        end
        it 'firstname_read should be double-byte character' do
        end
        it 'lastname_read should be double-byte character' do
        end
        it 'firstname_read should be double-byte kana' do
        end
        it 'lastname_read should ne double-byte kana' do
        end
        it 'birthday should be presesnt' do
        end
      end

    end
  end
end

