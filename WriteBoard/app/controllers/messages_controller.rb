class MessagesController < ApplicationController
  before_filter :prepare_messages, :only => [:index]
  before_filter :prepare_message, :only => [:edit, :update, :destroy]

  def index

  end

  def create
    @message = current_user.messages.new(params[:message])
    if @message.save
      flash[:notice] = "Message posted successfully."
      redirect_to "index"
    else
      prepare_messages
      render "index"
    end
  end

  def edit
    
  end

  def update
    if @message.update_attributes params[:message]
      flash[:notice] = "Message updated successfully."
      redirect_to "index"
    else
      render "edit"
    end
  end

  def destroy
    @message.destroy
    flash[:notice] = "Message deleted successfully."
    redirect_to "index"
  end

private

  def prepare_messages
    @messages = Message.all
  end

  def prepare_message
    @message = Message.find params[:id]
  end
end
