# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands

```bash
bin/dev              # Start development server (Rails + Tailwind watcher via foreman)
bin/ci               # Full CI pipeline (setup, lint, security scans, tests)
bin/rubocop          # Run RuboCop linter
bundle exec rspec    # Run full test suite
bundle exec rspec spec/models/note_spec.rb  # Run a single spec file
```

## Architecture

**Scratchpad** is a single-note collaborative editor built with Rails 8.1 and Hotwire.

**Core flow:** The app boots with one seeded `Note` record (id=1). `NotesController#index` displays it; `#update` saves and broadcasts changes to all connected clients via `Note.broadcast_update_to`. Turbo Streams on the client re-render the note partial without a full page reload.

**Key components:**
- `Note` model — uses `has_rich_text :content` (Action Text) for rich text storage
- `app/javascript/controllers/` — Stimulus controllers; `loading_controller.js` handles opacity feedback during refresh
- Lexxy is used as the rich-text editor, imported via Importmap (no Node build step)
- Solid Cable (gem) backs Action Cable instead of Redis

**MCP Server:** Exposed at `/mcp/sse` and `/mcp/messages` via the `fast-mcp` gem. `app/tools/NoteTool` and `app/resources/NoteResource` expose the note content. Auto-discovered via `config/initializers/fast_mcp.rb`.

**Testing:** RSpec with Capybara + Selenium for system tests. Specs live in `spec/{models,requests,system,tools,resources}/`.

**No Node runtime required** — JavaScript dependencies are managed via Importmap (`config/importmap.rb`).
