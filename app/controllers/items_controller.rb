class ItemsController < ApplicationController
  before_action :move_to_index, only: [:new, :crate]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all.order('created_at DESC')
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

  # status_id

  def item_params
    params.require(:item).permit(:image, :name, :info, :category_id, :status_id, :shipping_fee_id, :prefecture_id, :scheduled_delively_id, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
