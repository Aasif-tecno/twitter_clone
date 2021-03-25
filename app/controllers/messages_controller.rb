class MessagesController < ApplicationController
  before_action :find_conversation

  def index
  @messages = @conversation.messages
    if @messages.length > 15
        @over_fifteen = true
        @messages = @messages.last(15) # @messages[-10..-1]
    end
    if params[:m]
        @over_fifteen = false
        @messages = @conversation.messages
    end
  @message = @conversation.messages.build
  end


  def new
    @message = @conversation.messages.build
  end

  def create
    @message = @conversation.messages.build(message_params)

    if @conversation.sender_id == current_user.id 
      recipient = User.find(@conversation.recipient_id)
    else
      recipient = User.find(@conversation.sender_id)
    end
    
    @notification = Notification.create(recipient: recipient.id,actor: current_user.id, message:@message, conversation:@conversation)
    @notification.save
    if @message.save
      redirect_to conversation_messages_path(@conversation)
    end
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    redirect_to conversation_messages_path(@conversation)
  end

  def read
    notify = Notification.where(conversation_id: params[:conversation_id])
    notify.destroy_all
    redirect_to conversation_messages_path(@conversation)
  end

  private
    def find_conversation
      @conversation = Conversation.find(params[:conversation_id])
    end
    
    def message_params
      params.require(:message).permit(:body, :user_id)
    end

end