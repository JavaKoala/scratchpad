class NoteResource < ApplicationResource
  uri 'note'
  resource_name 'Note'
  description 'Scratchpad note'
  mime_type 'text/html'

  def content
    Note.find(1).content.to_trix_html
  end
end
