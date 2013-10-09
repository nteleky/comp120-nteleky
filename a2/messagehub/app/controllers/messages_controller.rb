class MessagesController < ApplicationController
  def index
  end

  def create
  	@message = Message.new(message_params)
  	if @message.save
  		redirect_to @message
  	else
  		render 'index'
  end

  def show
  end
  private

  def message_params
  	params.require(:Message).permit(:app_id, :content, :username)
  end

end
end