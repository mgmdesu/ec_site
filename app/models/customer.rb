class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :orders, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :ships, dependent: :destroy
  
  # 会員氏名をフルネームで表示
  def full_name
    self.last_name + "" + self.first_name
  end 
  
end
