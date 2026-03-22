class Admin::DashboardController < ApplicationController
  before_action :only_allow_admins

  def index
    @questions = Question.all
  end
end

private

def only_allow_admins
  return if Current.user.role == 'admin'
  terminate_session
end
