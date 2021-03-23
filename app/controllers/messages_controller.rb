class MessagesController < ApplicationController
  before_action :find_conversation

  def index
  @messages = @conversation.messages
    if @messages.length > 10
        @over_ten = true
        @messages = @messages[-10..-1]
    end
    if params[:m]
        @over_ten = false
        @messages = @conversation.messages
    end
  @message = @conversation.messages.build
  end


  def new
    @message = @conversation.messages.build
  end

  def create
    @message = @conversation.messages.build(message_params)
    if @message.save
      redirect_to conversation_messages_path(@conversation)
    end
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
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