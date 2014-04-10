class Guardians::RegistrationsController < Devise::RegistrationsController

  def new
    super
  end

  def create
    super do |resource|
      resource.user_id = current_user.id
    end
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
