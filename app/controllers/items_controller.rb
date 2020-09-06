class ItemsController < ApplicationController
  before_action :move_to_index, only: [:new, :crate]
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
    redirect_to action: :index
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :info, :category_id, :items_status_id, :shipping_fee_id, :prefecture_id, :scheduled_delivery_id, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
