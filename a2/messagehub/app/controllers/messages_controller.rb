class MessagesController < ApplicationController

  def index
     @messages = Message.where("created_at > ?", Time.at(params[:after].to_i + 1)).order('created_at DESC')
  	
  end

  def create
  	@message = Message.new(message_params)

  	@message.save
  end


  def show
  	@message = Message.find(params[:id])
  end

  private
  def message_params
  	params.require(:message).permit(:app_id, :content, :username)
  end

end