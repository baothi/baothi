class Api::V1::RegistrationsController < Api::V1::BaseApiController
  skip_before_filter :api_authenticate_user!

  api :POST, 'v1/users', 'Sign up.'
  param_group :registration, Api::V1::Docs::RegistrationsDoc
  example Api::V1::Docs::RegistrationsDoc.registration
  def create
    begin
      required  :email, :password, :password_confirmation
      latitude  = "%.10f" % params[:latitude] if params[:latitude] && params[:latitude].length > 0
      longitude = "%.10f" % params[:longitude] if params[:longitude] && params[:longitude].length > 0
      user = User.new(
                        :email      => params[:email],
                        :password   => params[:password],
                        :password_confirmation => params[:password_confirmation],
                        :address    => params[:address],
                        :latitude   => latitude,
                        :longitude  => longitude,
                        :is_online  => true

                      )
      if user.valid? 
        user.save
        render :json => {
                          :status  => 201,
                          :message => t('controller.registrations.create.successfully'),
                          :user => user
                        }
      else
        errors = user.errors.as_json
        render json: { 
                      :status   => 400, 
                      :message  => t('controller.registrations.create.unsuccessfully'), 
                      :errors   => errors
                    }
      end
    rescue => e
      render json: {  :status   => 400,
                      :message  => t('controller.registrations.create.unsuccessfully'),
                      :errors   => [e.message]
                    }
    end
  end


  private
  def user_params
    params.require(:user).permit( :username, :email, 
                                  :password, :password_confirmation, 
                                  :is_online,                                 
                                  )
  end

end
