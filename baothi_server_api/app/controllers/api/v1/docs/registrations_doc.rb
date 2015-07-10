class Api::V1::Docs::RegistrationsDoc <  ActionController::Base

  def_param_group :registration do
    param :email, String, :required => true
    param :password, String, :required => true
    param :password_confirmation, String, :required => true
    param :latitude, Float
    param :longitude, Float
    param :address, String
  end

  def self.registration
    <<-EOS
      {
        status: 201
        message: "Sign up successfully!"
        user_id: 126
        auth_token: "1uZQ6HJoswzThmVAvWw7"
        device_token: "12345654321"
        username: "test12312"
        email: "test12312@aa.aa"
        longitude: null
        latitude: null
        address: null
        is_online: true
      }
    EOS
  end

end