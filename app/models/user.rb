class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, :email, :password, presence: true
  validates :email, uniqueness: true
  validates :password, length: { minimum: 6 }

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, presence: true, format: { with: VALID_PASSWORD_REGEX }
  validates :password, confirmation: true

  validates :last_name, :first_name, presence: true, format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/ }
  # 正規表現の表し方
  # なまえの正規表現をwithのとなりに
  validates :name, presence: true, format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/, message: 'はカタカナで入力して下さい' }
  validates :last_name_kana, :first_name_kana, :birthday, presence: true
  validates :last_name_kana, :first_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい' }
end
