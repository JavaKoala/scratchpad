require 'rails_helper'

RSpec.describe 'Notes', type: :system do
  before do
    Note.find_or_create_by(id: 1)
  end

  it 'creates a note' do
    visit '/notes'

    expect(page).to have_text('Scratchpad')

    find_by_id('note_content-content').click.set('I can haz note')
    click_button('Save')

    expect(page).to have_text('I can haz note')
    expect(Note.find(1).content.to_plain_text).to eq('I can haz note')
  end

  it 'refreshes content' do
    visit '/notes'

    expect(page).to have_text('Scratchpad')
    expect(page).to have_no_text('New note')

    Note.find(1).update!(content: 'New note')

    click_link('Refresh')

    expect(page).to have_text('New note')
  end

  it 'clears content' do
    note = Note.find(1)
    note.update!(content: 'Old note')

    visit '/notes'

    expect(page).to have_text('Old note')

    click_button('Clear')

    expect(page).to have_no_text('Old note')
    expect(note.reload.content.to_plain_text).to be_empty
  end
end
