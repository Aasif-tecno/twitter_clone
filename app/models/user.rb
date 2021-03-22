class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tweeets, dependent: :destroy    
  has_one_attached :avatar
  
  has_many :followed_users, foreign_key: :follower_id, class_name: "Follow"
  has_many :followees, through: :followed_users

  has_many :following_users, foreign_key: :followee_id, class_name: "Follow"
  has_many :followers, through: :following_users

  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  def self.search(param)
    to_send_back = where("username like ? or email like ?", "%#{param}%", "%#{param}%")
    return nil unless to_send_back
    to_send_back
  end


end
