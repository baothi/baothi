class Api::V1::Docs::BaseApiDoc <  ActionController::Base
  def_param_group :authentication do
    param :auth_token, String, :desc => 'User authentication token', :required => true
  end
end
