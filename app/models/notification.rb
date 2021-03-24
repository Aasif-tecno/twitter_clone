class Notification < ApplicationRecord

  belongs_to :message, class_name: "Message"
  belongs_to :conversation, class_name: "Conversation"


end
