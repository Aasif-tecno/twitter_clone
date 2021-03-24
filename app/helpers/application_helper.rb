module ApplicationHelper
    def bootstrap_class_for(flash_type)
        {
          success: "alert-success",
          error: "alert-danger",
          alert: "alert-warning",
          notice: "alert-info"
        }.stringify_keys[flash_type.to_s] || flash_type.to_s
      end

      def notification
        Notification.where("recipient = ? and read = ? ",current_user, false)
      end
      def notification_message(conversation_id)
        notification = Notification.where("recipient = ? and read = ? ",current_user, false)
        conversation = notification.where(conversation_id: conversation_id).count
      end
end
