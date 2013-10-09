class MessagesController < ApplicationController

  def index
  	@messages = Message.all.includes(:app)
  end

  def create
  	@message = Message.new(message_params)

  	@message.save
  end


  def show
  end

  private
  def message_params
  	params.require(:message).permit(:app_id, :content, :username)
  end

end