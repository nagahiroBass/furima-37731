require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before 'set information' do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order_form = FactoryBot.build(:order_form, user_id: @user.id, item_id: @item.id)
    sleep 0.1
  end

  context 'should be valid' do
    it 'should be  valid' do
      expect(@order_form).to be_valid
    end

    it 'should be valid without building name' do
      @order_form.building_name = ''
      expect(@order_form).to be_valid
    end
  end

  context 'should not be valid' do
    it 'postal code shold be present' do
      @order_form.postal_code = ''
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Postal code can't be blank")
    end

    it 'postal code sholud be single byte numeric number with -' do
      @order_form.postal_code = '1234567'
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include('Postal code はハイフンを入れて7桁の半角文字列で入力してください')
    end

    it 'prefecture should be present' do
      @order_form.prefecture_id = 1
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Prefecture can't be blank")
    end

    it 'city should be present' do
      @order_form.city = ''
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("City can't be blank")
    end

    it 'house number should be present' do
      @order_form.house_number = ''
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("House number can't be blank")
    end

    it 'phone number should be present' do
      @order_form.phone_number = ''
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Phone number can't be blank")
    end

    it 'phone number should be 10 characters or more' do
      @order_form.phone_number = '123456789'
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include('Phone number はハイフン無し、10〰11桁の半角数字で入力してください')
    end

    it 'phone number should be 11 characters or less' do
      @order_form.phone_number = '123456789012'
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include('Phone number はハイフン無し、10〰11桁の半角数字で入力してください')
    end

    it 'phone number should be singbe byte numeric characters without -' do
      @order_form.phone_number = '090-1234-5678'
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include('Phone number はハイフン無し、10〰11桁の半角数字で入力してください')
    end

    it 'phone number should not be double byte characters' do
      @order_form.phone_number = '０９０１２３４５６７８'
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include('Phone number はハイフン無し、10〰11桁の半角数字で入力してください')
    end

    it 'phone number should be only singbe byte numeric characters without alphabet' do
      @order_form.phone_number = '090asdfghjk'
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include('Phone number はハイフン無し、10〰11桁の半角数字で入力してください')
    end

    it 'token should be present' do
      @order_form.token = nil?
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Token can't be blank")
    end

    it 'user should be present' do
      @order_form.user_id = ''
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("User can't be blank")
    end

    it 'item should be present' do
      @order_form.item_id = ''
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Item can't be blank")
    end
  end
end
