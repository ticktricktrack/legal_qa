class AnswersController < ApplicationController
  layout "lawyer"

  def new
    set_question
    @answer = Answer.new(question_id: params[:question_id])
  end

  def create
    @answer = Answer.new(answer_params)
    @answer.user_id = Current.user.id

    if @answer.save
      redirect_to lawyer_questions_path
    else
      render :edit
    end
  end

  private

  def set_question
    puts params
    @question = Question.find(params[:question_id])
  end

  def answer_params
    params.require(:answer).permit(:body, :fee, :question_id)
  end
end
