class Question < ApplicationRecord
  belongs_to :user
  default_scope { order(created_at: :desc) }

  # Broadcasters
  after_create_commit -> { broadcast_prepend_to "questions", target: 'questions-list', partial: "shared/question"}
  after_update_commit -> { broadcast_replace_to "todos" }
end
