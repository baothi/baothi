class Api::V1::SessionsController < Api::V1::BaseApiController
  skip_before_filter :api_authenticate_user!, :only => :create

  api :POST, 'v1/users/sign_in', 'Sign in'
  param :email, String, :desc => "Your email", :required => true
  param :password, String, :desc => "Your password", :required => true
  example Api::V1::Docs::SessionsDoc.sign_in
  def create
    required :email, :password
    email = params[:email].strip.downcase
    resource = User.find_for_database_authentication(:email=> email)
    return invalid_login_attempt unless resource
    if resource.valid_password?(params[:password])
      #NOTE reset token to support force logout in the case of multiple logins
      resource.reset_authentication_token!
      @current_user = resource
      # reset device token 
      @current_user.is_online   = true
      @current_user.save(:validate => false)
      render :json => {
                        :status         => 200,
                        :message        => t('controller.sessions.create.successfully'),
                        :user => @current_user
                      }
    else
      render :json=> {
        :status => 401, 
        :message => t('controller.sessions.create.wrong_username_or_password'),
        :errors  => t('controller.sessions.create.wrong_username_or_password'),
      }
    end
  end

  api :DELETE, 'v1/users/sign_out', 'Sign out'
  param_group :authentication, Api::V1::Docs::BaseApiDoc
  def destroy
    if current_user.reset_authentication_token!
      current_user.assign_attributes(:is_online => false)
      current_user.save(validate: false)
      render :json => { :status => 204, :message => t('controller.sessions.destroy.successfully') }
    else
      render :json => { :status => 400, :message => t('controller.sessions.destroy.unsuccessfully') }
    end
  end

  protected
  def invalid_login_attempt
    warden.custom_failure!
    if (params[:username].blank? || params[:username].nil?) && (params[:password].blank? || params[:password].nil?)
      render :json=> {:status => 401, :message => t('controller.sessions.create.wrong_username_or_password')}
    elsif params[:username].blank? || params[:username].nil?
      render :json=> {:status => 401, :message => t('controller.sessions.create.wrong_username_or_password')}
    elsif params[:password].blank? || params[:password].nil?
      render :json=> {:status => 401, :message => t('controller.sessions.create.wrong_username_or_password')}
    else
      render :json=> {:status => 401, :message => t('controller.sessions.create.wrong_username_or_password')}
    end
  end
end
