class Question < ApplicationRecord
  belongs_to :user
  has_one :answer
  default_scope { order(created_at: :desc) }

  # Broadcasters
  after_create_commit -> { broadcast_prepend_to "questions", target: 'questions-list', partial: "shared/question"}
  after_update_commit -> { broadcast_replace_to "todos" }

  def open?
    status == 'open'
  end

  def closed?
    status == 'closed'
  end

  def answered?
    status == 'answered'
  end
end
