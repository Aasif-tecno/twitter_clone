class Message < ApplicationRecord
    belongs_to :conversation
    belongs_to :user
    has_many :notifications, dependent: :destroy
    validates_presence_of :body, :conversation_id, :user_id

    def message_time
        created_at.strftime("%l:%M %p")
    end
end
