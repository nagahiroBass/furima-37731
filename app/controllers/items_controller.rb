class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :ensure_correct_user, only: [:edit, :destroy, :update]
  before_action :ensure_nowonsale_item, only: [:edit, :update, :destroy]

  def index
    @items = Item.order(id: 'DESC')
  end

  def new
    @item_form = ItemForm.new
  end

  def create
    @item_form = ItemForm.new(item_form_params)
    if @item_form.valid?
      @item_form.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def ensure_correct_user
    redirect_to root_path if @item.user_id != current_user.id
  end

  def item_form_params
    params.require(:item_form).permit(:name, :explanation, :image, :category_id, :condition_id, :shipping_fee_id, :prefecture_id,
                                 :days_to_ship_id, :price, :user_id).merge(user_id: current_user.id)
  end

  def ensure_nowonsale_item
    redirect_to root_path unless @item.order.nil?
  end
end
