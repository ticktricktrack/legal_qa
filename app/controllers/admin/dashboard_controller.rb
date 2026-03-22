class Admin::DashboardController < ApplicationController
  before_action :only_allow_admins
  layout 'admin'

  def index
    @questions = Question.all
    @total_questions = Question.count
    @total_fees_outstanding = Answer.total_fees_outstanding
    @total_fees_paid = Answer.total_fees_paid
  end
end

private

def only_allow_admins
  return if Current.user.role == 'admin'
  terminate_session
end
