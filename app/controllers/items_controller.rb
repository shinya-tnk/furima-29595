class ItemsController < ApplicationController
  def index
  end
  def new
    @item = Item.new
  end

  def create
    @item = Item.find(item_params)
    @item.create
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :image, :item_condition_id, :postage_type_id, :prefecture_id, :preparation_day_id, :price_id, :category_id)
  end
end
