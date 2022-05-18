class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  def index
    @order_form = OrderForm.new
  end

  def create
    @order_form = OrderForm.new(set_order_params)
    if @order_form.valid?
      @order_form.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def set_item
    @item = Item.find(params[:item_id])
  end

  def set_order_params
    params.require(:order_form).permit(:city, :house_number, :building_name, :postal_code, :phone_number, :prefecture_id).merge(item_id: params[:item_id], user_id: current_user.id)
  end
end
