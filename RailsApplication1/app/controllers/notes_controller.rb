class NotesController < ApplicationController
  before_filter :prepare_note, :only => [:show, :edit, :update, :destroy]
  def index
    @notes = Note.all
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new params[:note]
    if @note.save
      redirect_to note_path(@note)
    else
      flash.now[:error] = "Error: #{@note.errors.full_messages.join('<br />')}"
      render :action => "new"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @note.update_attributes params[:note]
      redirect_to note_path(@note)
    else
      flash.now[:error] = "Error: #{@note.errors.full_messages.join('<br />')}"
      render :action => "edit"
    end
  end

  def destroy
    @note.destroy
    redirect_to root_path
  end

private

  def prepare_note
    @note = Note.find params[:id]
  end
end
