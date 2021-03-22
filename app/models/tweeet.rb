class Tweeet < ApplicationRecord
    belongs_to :user
    has_one_attached :tweeet_image
    has_rich_text :tweeet
    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy
    
    def liked?(user)
        !!self.likes.find{|like| like.user.id == user.id}
    end
end
