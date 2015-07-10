# require 'exceptions'
class Api::V1::BaseApiController < ActionController::Base
  before_filter :api_authenticate_user!

  unless Rails.env.development?
    rescue_from StandardError, :with => :render_error_all
    rescue_from ActiveRecord::RecordNotFound, :with => :render_error_not_found
  end

  def render_error_all(exception)
    render_error_basic(exception, 'Something went wrong!')
  end

  # exception handling
  def render_error_basic(exception, message, status=500)
    logger.error exception
    render :json => { :status => status, :message => message, :errors => {:base => [exception.message] } }

  end

  def render_error_not_found(exception)
    render_error_basic(exception, 'Not found', 404)
  end

  def api_authenticate_user!
    @current_user = User.find_by_authentication_token(params[:auth_token])
    if !@current_user
      render :json => { :status => 401, :message => t('controller.base_api.api_authenticate_user.error_token')}
    end
  end

  def current_user
    @current_user ||= User.find_by_authentication_token(params[:auth_token])
  end

  def required(*parameters)
    errors = []
    message = ''
    parameters.each do |param|
      if param.class == Hash
        message = param[:message] unless param[:message].blank?
        param.each do |key, value|
          if value.class == Array
            value.each do |p|
              errors << "#{key}[#{p}]" if params[key.to_sym].class != ActionController::Parameters || params[key.to_sym][p.to_sym].blank?
              # using ActionController::Parameters instead of Hash
            end
          end
        end
      else
        errors << param if params[param.to_sym].nil?
      end
    end
    if errors.size > 0
      raise Exceptions::ApiParameterMissing.new(errors, message)
    end
  end

  # rescue_from Exceptions::ApiParameterMissing do |exception|
  #   render :json => exception.to_json
  # end
  
end
