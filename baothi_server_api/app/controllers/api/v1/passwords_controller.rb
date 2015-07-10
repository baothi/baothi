class Api::V1::PasswordsController < Api::V1::BaseApiController
  skip_before_filter :api_authenticate_user!, :only => [:forgot_password]

  api :PUT, 'v1/users/change_password', "Change password"
  param_group :password, Api::V1::Docs::PasswordsDoc
  param_group :authentication, Api::V1::Docs::BaseApiDoc
  def change_password
    required :current_password ,user: [:password, :password_confirmation]
    if current_user
      if current_user.valid_password?(params[:current_password])
        if current_user.update_attributes user_params
          render json: {status: 200, message: t('controller.passwords.changed_password.successfully')}
        else
          render json: { status: 400, message: t('controller.passwords.changed_password.unsuccessfully'), errors: current_user.errors}
        end
      else
        render json: { status: 400, message: t('controller.passwords.changed_password.wrong_password')}
      end
    else
      render json: {status: 404, message: t('controller.base_api.render_error_not_found.not_found')}
    end
  end

  api :PUT, 'v1/users/forgot_password', "Forgot password"
  param :email, String, :desc => "User's email", :required => true
  def forgot_password
    required :email
    user = User.find_by_email params[:email]
    if user
      generated_password = rand(100_000...1_000_000)
      if user.update_attributes :password => generated_password, :password_confirmation => generated_password
        render json: { status: 200, message: t('controller.passwords.forgot_password.message_sent') }
      else
        render json: { status: 400, message: 'Common error message', errors: user.errors}
      end
    else
      render json: {status: 404, message: t('controller.passwords.forgot_password.not_found')}
    end
  end

  private
  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
