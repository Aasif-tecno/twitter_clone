class Tweeet < ApplicationRecord
    belongs_to :user
    has_one_attached :tweeet_image
    has_rich_text :tweeet
end
