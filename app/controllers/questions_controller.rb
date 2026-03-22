class QuestionsController < ApplicationController
  layout 'user'

  def index
    @questions = Current.user.questions
  end

  def new
    @question = Current.user.questions.new
  end

  def create
    @question = Current.user.questions.new(question_params)

    respond_to do |format|
      if @question.save
        format.turbo_stream
        format.html { redirect_to root_path }
      else
        format.turbo_stream { render turbo_stream: turbo_stream.replace("#{helpers.dom_id(@question)}_form", partial: "form", locals: { question: @question }) }
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @question.update(question_params)
        format.turbo_stream { render turbo_stream: turbo_stream.replace("#{helpers.dom_id(question)}", partial: "shared/question", locals: { question: @question }) }
        format.html { redirect_to root_path}
      else
        format.html { render :edit }
      end
    end
  end

  private

  def set_question
    @question = Current.user.questions.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body, :title, :category, :status)
  end
end
