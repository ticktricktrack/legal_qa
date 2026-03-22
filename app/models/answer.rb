class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :user

  def self.total_fees_paid
    Answer.joins(:question).where(question: { status: 'closed' } ).sum(:fee).to_i
  end

  def self.total_fees_outstanding
    Answer.joins(:question).where(question: { status: 'answered' } ).sum(:fee).to_i
  end
end
