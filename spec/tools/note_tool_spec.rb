require 'rails_helper'

RSpec.describe NoteTool do
  before do
    Note.find_or_create_by(id: 1)
  end

  describe '#call' do
    it 'returns the note' do
      Note.first.update!(content: 'Get note')
      note_tool = described_class.new

      expect(note_tool.call).to eq('Get note')
    end
  end
end
