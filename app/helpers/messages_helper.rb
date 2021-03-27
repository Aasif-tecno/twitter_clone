module MessagesHelper

  
  def message_date message
    return "Today" if message.created_at.to_date ==  Date.today
    return "Yesterday" if message.created_at.to_date ==Date.yesterday
    return  message.created_at.strftime("%d/%m/%Y") rescue nil
  end

end