class NotesController < ApplicationController
 def create
   @note = Note.new(note_params)
   @note.user_id = current_user.id

   if @note.save
     redirect_to track_path(@note.track)
   else
     redirect_to track_path(@note.track)
   end
 end

  def destroy
    note = current_user.notes.find(params[:id])
    if note
      track = note.track
      note.destroy
      redirect_to track_path(track)
    else
      render text: 'cannot be destroyed', status: :unprocessable_entity
    end
  end

  private
  def note_params
    params.require(:note).permit(:body, :track_id)
  end
end
