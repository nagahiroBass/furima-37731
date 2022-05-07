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
          @user.nickname = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end
        it 'email should be present' do
          @user.email = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end
        it 'email should be unique' do
          @user.save
          another_user = FactoryBot.build(:user)
          another_user.email = @user.email
          another_user.valid?
          expect(another_user.errors.full_messages).to include('Email has already been taken')
        end
        it 'email should have @' do
          @user.email = 'test.com'
          @user.valid?
          expect(@user.errors.full_messages).to include('Email is invalid')
        end
        it 'password should be present' do
          @user.password = ''
          @user.password_confirmation = @user.password
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end
        it 'password should be more than 6 characters' do
          @user.password = 'test1'
          @user.password_confirmation = @user.password
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
        end
        it 'password should be a mixture of singlebyte alphanumeric characters' do
          @user.password = 'testpass'
          @user.password_confirmation = @user.password
          @user.valid?
          expect(@user.errors.full_messages).to include('Password must include both alphabetic and numeric characters, without double-byte characters')
        end
        it 'password only numbers should not be present' do
          @user.password = '123456'
          @user.password_confirmation = @user.password
          @user.valid?
          expect(@user.errors.full_messages).to include('Password must include both alphabetic and numeric characters, without double-byte characters')
        end
        it 'password must not contain double-byte characters' do
          @user.password = 'テストパスワード'
          @user.password_confirmation = @user.password
          @user.valid?
          expect(@user.errors.full_messages).to include('Password must include both alphabetic and numeric characters, without double-byte characters')
        end
        it 'password should be same to password_confirmation' do
          @user.password_confirmation = 'testpass1'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
      end
      context 'identification information' do
        it 'firstname should be present' do
          @user.firstname = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Firstname can't be blank")
        end
        it 'lastname should be present' do
          @user.lastname = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Lastname can't be blank")
        end
        it 'firstname_read should be present' do
          @user.firstname_read = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Firstname read can't be blank")
        end
        it 'lastname_read should be present' do
          @user.lastname_read = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Lastname read can't be blank")
        end
        it 'firstname should be double-byte character' do
          @user.firstname = 'testname'
          @user.valid?
          expect(@user.errors.full_messages).to include('Firstname should be double-byte character')
        end
        it 'lastname should be double-byte character' do
          @user.lastname = 'testname'
          @user.valid?
          expect(@user.errors.full_messages).to include('Lastname should be double-byte character')
        end
        it 'firstname_read should be double-byte kana' do
          @user.firstname_read = 'ﾃｽﾄｶﾅ'
          @user.valid?
          expect(@user.errors.full_messages).to include('Firstname read should be double-byte kana')
        end
        it 'lastname_read should be double-byte kana' do
          @user.lastname_read = 'ﾃｽﾄｶﾅ'
          @user.valid?
          expect(@user.errors.full_messages).to include('Lastname read should be double-byte kana')
        end
        it 'birthday should be presesnt' do
          @user.birthday = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Birthday can't be blank")
        end
      end
    end
  end
end
