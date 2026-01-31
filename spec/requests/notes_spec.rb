require 'rails_helper'

RSpec.describe 'Notes', type: :request do
  before do
    Note.find_or_create_by(id: 1)
  end

  describe 'GET /index' do
    it 'returns http success' do
      get notes_path

      expect(response).to have_http_status(:success)
    end
  end

  describe 'PATCH /notes/:id' do
    it 'updates the note' do
      note = Note.find(1)
      patch note_path(note),
            params: { note: { content: 'test' } }

      expect(note.reload.content.body.to_plain_text).to eq('test')
    end
  end
end
