class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update]
  before_action :ensure_correct_user, only: :edit

  def index
    @items = Item.order(id: 'DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
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

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def ensure_correct_user
    redirect_to root_path if @item.user_id != current_user.id
  end

  def item_params
    params.require(:item).permit(:name, :explanation, :image, :category_id, :condition_id, :shipping_fee_id, :prefecture_id,
                                 :days_to_ship_id, :price, :user_id).merge(user_id: current_user.id)
  end
end
