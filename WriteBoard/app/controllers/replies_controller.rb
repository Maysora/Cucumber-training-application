class RepliesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :prepare_message, :only => [:new, :create]
  before_filter :prepare_reply, :only => [:edit, :update, :destroy]

  def new
    @reply = @message.replies.new :author => current_user
  end

  def create
    @reply = @message.replies.new params[:message].merge(:author => current_user)
    if @reply.save
      flash[:notice] = "Message replied successfully."
      redirect_to root_path
    else
      render "new"
    end
  end

  def edit

  end

  def update
    if @reply.update_attributes params[:message]
      flash[:notice] = "Reply updated successfully."
      redirect_to root_path
    else
      render "edit"
    end
  end

  def destroy
    @reply.destroy
    flash[:notice] = "Reply deleted successfully."
    redirect_to root_path
  end

private

  def prepare_message
    @message = Message.find params[:message_id]
  end

  def prepare_reply
    @reply = Message.find params[:id]
  end
end
