class Guardians::RegistrationsController < Devise::RegistrationsController

  def create
    super do |resource|
      resource.user_id = current_user.id
    end
  end

end
