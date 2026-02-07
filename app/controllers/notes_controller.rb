class NotesController < ApplicationController
  def index
    @note = Note.find(1)
  end

  def update
    note = Note.find(1)
    note.update!(note_params)

    note.broadcast_update_to 'note_1', partial: 'notes/note', locals: { note: note }
    redirect_to notes_path
  end

  private

  def note_params
    params.expect(note: [:content])
  end
end
