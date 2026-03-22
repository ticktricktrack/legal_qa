class Question < ApplicationRecord
  belongs_to :user

  # Broadcasters
  after_create_commit -> { broadcast_append_to "questions", target: 'questions-list'}
  after_update_commit -> { broadcast_replace_to "todos" }
end
