class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new
  before_action :set_item, only: [:show, :edit]

  def index
    @items = Item.includes(:user).order('created_at DESC')
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
    unless user_signed_in? && current_user.id == @item.user.id
      redirect_to action: :show
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :image, :price, :category_id, :item_condition_id, :postage_type_id, :prefecture_id, :preparation_day_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
