class QuestionsController < ApplicationController
  def index
    @questions = Current.user.questions
  end
end
