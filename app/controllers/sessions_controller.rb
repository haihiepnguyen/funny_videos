# app/controllers/users/sessions_controller.rb

class Users::SessionsController < Devise::SessionsController
  layout "application"

  def login
    super
  end

  def logout
    return unless current_user.present?

    sign_out_and_redirect(current_user)
  end
end