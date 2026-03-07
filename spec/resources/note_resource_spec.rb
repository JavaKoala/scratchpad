require 'rails_helper'

RSpec.describe NoteResource do
  before do
    Note.find_or_create_by(id: 1)
  end

  describe '#content' do
    it 'returns the note' do
      Note.first.update!(content: 'New note')
      note_resource = described_class.new

      expect(note_resource.content).to eq('New note')
    end
  end
end
