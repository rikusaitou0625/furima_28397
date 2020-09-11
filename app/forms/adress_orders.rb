class AdressOrders

  include ActiveModel::Model
  attr_accessor :post_number, :prefecture, :city, :adress, :building, :phone_number, :token, :item_id,:user_id


  with_options presence: true do 
    validates :post_number
    validates :prefecture
    validates :city
    validates :adress
  end
  validates :post_number, format: { with:/\A\d{3}[-]\d{4}\z/}
  validates :phone_number, presence: true, format: { with: /\d{10,11}/, message: 'は11桁以内の半角数字で入力して下さい' }
def save
   # 住所の情報を保存
   Address.create(post_number: post_number, prefecture: prefecture, city: city, adress: adress, building: building)
   order =Order.create(user_id: user_id, item_id: item_id)
   # 寄付金の情報を保存
   
   
 end

end