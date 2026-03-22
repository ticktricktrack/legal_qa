module QuestionsHelper
  def badge_color(question)
    puts question.status
    return 'warning' if question.status == 'answered'
    return 'success' if question.status == 'open'
    'info'
  end

  def my_question?(question)
    return question.user == Current.user
  end
end
