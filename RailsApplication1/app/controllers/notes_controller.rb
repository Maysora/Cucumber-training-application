class NotesController < ApplicationController
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
    @note = Note.find params[:id]
  end

  def edit
    @note = Note.find params[:id]
  end

  def update
    @note = Note.find params[:id]
    if @note.update_attributes params[:note]
      redirect_to note_path(@note)
    else
      flash.now[:error] = "Error: #{@note.errors.full_messages.join('<br />')}"
      render :action => "edit"
    end
  end
end
