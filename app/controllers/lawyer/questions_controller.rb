class Lawyer::QuestionsController < ApplicationController
  layout 'lawyer'

  def index
    @questions = Question.all
  end
end
