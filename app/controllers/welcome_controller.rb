class WelcomeController < ApplicationController
  def index
    @questions = %w[what when where why how]
  end
end
