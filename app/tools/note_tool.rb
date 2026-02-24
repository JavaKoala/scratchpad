class NoteTool < ApplicationTool
  description 'Get the scratchpad note'

  # Optional: Add annotations to provide hints about the tool's behavior
  # annotations(
  #   title: 'User Greeting',
  #   read_only_hint: true,      # This tool only reads data
  #   open_world_hint: false     # This tool only accesses the local database
  # )

  arguments do
    # optional(:prefix).filled(:string).description('Prefix to add to the greeting')
  end

  def call
    Note.find(1).content.to_trix_html
  end
end
