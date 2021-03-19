class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tweeets
  has_one_attached :avatar
  

  def self.search(param)
    param.strip!
    to_send_back = where("username like ? or email like ?", "%#{param}%", "%#{param}%")
    return nil unless to_send_back
    to_send_back
  end


end
