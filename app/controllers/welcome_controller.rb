class WelcomeController < ApplicationController
  def index
    if user_signed_in?
      redirect_to users_dashboard_path
    end
    @questions = %w[what when where why how]
  end
end
