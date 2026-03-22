class RouteByRole
  include Rails.application.routes.url_helpers

  def for(user)
    return admin_dashboard_path if user.admin?
    return lawyer_questions_path if user.lawyer?
    root_path
  end
end
