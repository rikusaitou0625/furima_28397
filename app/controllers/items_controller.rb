class ItemsController < ApplicationController
  before_action :move_to_index, only: [:new, :crate]

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to action: :index

    else
      render :new

    end
  end

  def show
    @item = Item.find(params[:id])
  end

  private 
  # status_id

  def item_params
    params.require(:item).permit(:image, :name, :info, :category_id, :status_id, :shipping_fee_id, :prefecture_id, :scheduled_delively_id, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
