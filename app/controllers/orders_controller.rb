class OrdersController < ApplicationController
  
  
  def index
    @item = Item.find(params[:item_id])
    @order = AdressOrders.new
    if user_signed_in? && current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def create
    @item = Item.find(params[:item_id])
    
    @order = AdressOrders.new(order_params)
    # binding.pry
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.permit(:token, :post_number, :prefecture, :city, :adress,:building, :phone_number, :item_id).merge(user_id: current_user.id)
  end


  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end

end
