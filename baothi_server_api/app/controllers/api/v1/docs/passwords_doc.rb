class Api::V1::Docs::PasswordsDoc <  ActionController::Base
  def_param_group :password do
    param :current_password, String, :desc => "Current password", :required => true
    param :user, Hash do
      param :password, String, :desc => "New password", :required => true
      param :password_confirmation, String, :desc => "Password confirmation", :required => true
    end
  end
end
