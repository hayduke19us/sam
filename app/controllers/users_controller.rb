class UsersController < ApplicationController

  before_action :authenticate_user!

  def dashboard
  end

  def create_profile
  end

  def update_profile
  end
end
