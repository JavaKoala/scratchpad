class NoteResource < ApplicationResource
  uri 'note'
  resource_name 'Note'
  description 'Scratchpad note'
  mime_type 'text/plain'

  def content
    Note.find(1).content.to_plain_text
  end
end
