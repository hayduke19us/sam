class Guardians::RegistrationsController < Devise::RegistrationsController

  before_action :authenticate_user!

  def new
    super
  end

  def create
    super
  end

  def update
    super
  end

  private

    def sign_up_params
      params.require(:guardian).permit( :email,
                                       :password,
                                       :password_confirmation,
                                       :user_id )
    end

end
