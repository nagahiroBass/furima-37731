require 'rails_helper'

RSpec.describe Address, type: :model do
  before do
    @address = FactoryBot.build(:address)
  end

  context 'should be valid' do
    it 'should be  valid' do
      expect(@address).to be_valid
    end

    it 'should be valid without building name' do
      @address.building_name = ''
      expect(@address).to be_valid
    end
  end

  context 'should not be valid' do
    it 'postal code shold be present' do
      @address.postal_code = ''
      @address.valid?
      expect(@address.errors.full_messages).to include("Postal code can't be blank")
    end

    it 'postal code sholud be single byte numeric number with -' do
      @address.postal_code = '1234567'
      @address.valid?
      expect(@address.errors.full_messages).to include("Postal code はハイフンを入れて半角文字列で入力してください")
    end

    it 'prefecture should be present' do
      @address.prefecture_id = 1
      @address.valid?
      expect(@address.errors.full_messages).to include("Prefecture can't be blank")
    end

    it 'city should be present' do
      @address.city = ''
      @address.valid?
      expect(@address.errors.full_messages).to include("City can't be blank")
    end

    it 'house number should be present' do
      @address.house_number = ''
      @address.valid?
      expect(@address.errors.full_messages).to include("House number can't be blank")
    end
    
    it 'phone number should be present' do
      @address.phone_number = ''
      @address.valid?
      expect(@address.errors.full_messages).to include("Phone number can't be blank")
    end

    it 'phone number should be singbe byte numeric characters rithout -' do
      @address.phone_number = '090-1234-5678'
      @address.valid?
      expect(@address.errors.full_messages).to include("Phone number はハイフン無しの半角数字で入力してください")
    end
  end
end
