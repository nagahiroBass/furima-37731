require 'rails_helper'

RSpec.describe ItemForm, type: :model do
  before do
    @item_form = FactoryBot.build(:item_form)
  end

  describe 'item_form registration' do
    context 'should be valid' do
      it 'should be valid' do
        expect(@item_form).to be_valid
      end
    end

    context 'should not be valid' do
      it 'name should be present' do
        @item_form.name = ''
        @item_form.valid?
        expect(@item_form.errors.full_messages).to include("Name can't be blank")
      end

      it 'explanation should not be blank' do
        @item_form.explanation = ''
        @item_form.valid?
        expect(@item_form.errors.full_messages).to include("Explanation can't be blank")
      end

      it 'category should not be blank' do
        @item_form.category_id = ''
        @item_form.valid?
        expect(@item_form.errors.full_messages).to include("Category can't be blank")
      end

      it 'condition should not be blank' do
        @item_form.condition_id = 1
        @item_form.valid?
        expect(@item_form.errors.full_messages).to include("Condition can't be blank")
      end

      it 'shipping fee should not be blank' do
        @item_form.shipping_fee_id = 1
        @item_form.valid?
        expect(@item_form.errors.full_messages).to include("Shipping fee can't be blank")
      end

      it 'prefecture should not be blank' do
        @item_form.prefecture_id = 1
        @item_form.valid?
        expect(@item_form.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'days to ship should not be blank' do
        @item_form.days_to_ship_id = 1
        @item_form.valid?
        expect(@item_form.errors.full_messages).to include("Days to ship can't be blank")
      end

      it 'price should not be blank' do
        @item_form.price = ''
        @item_form.valid?
        expect(@item_form.errors.full_messages).to include("Price can't be blank")
      end

      it 'price should be greater than 299' do
        @item_form.price = 299
        @item_form.valid?
        expect(@item_form.errors.full_messages).to include('Price must be greater than or equal to 300')
      end

      it 'price should be less than 10,000,000' do
        @item_form.price = 10_000_000
        @item_form.valid?
        expect(@item_form.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end

      it 'price shold be single byte numeric characters' do
        @item_form.price = 'hoge'
        @item_form.valid?
        expect(@item_form.errors.full_messages).to include('Price is not a number')
      end

      it 'price should not be double byte characters' do
        @item_form.price = '１０００'
        @item_form.valid?
        expect(@item_form.errors.full_messages).to include('Price is not a number')
      end

      it 'price should not include alphabet' do
        @item_form.price = '100doller'
        @item_form.valid?
        expect(@item_form.errors.full_messages).to include('Price is not a number')
      end

      it 'item_form should have ome image' do
        @item_form.image = nil
        @item_form.valid?
        expect(@item_form.errors.full_messages).to include("Image can't be blank")
      end

      it 'item_form should belong to user' do
        @item_form.user_id = nil
        @item_form.valid?
        expect(@item_form.errors.full_messages).to include("User can't be blank")
      end
    end
  end
end
