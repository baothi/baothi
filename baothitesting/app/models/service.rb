class Service
  def self.create_user(email,password,confirm_password,address)
    domain = Rails.application.config.domain
    response = Curl.post("#{domain}/api/v1/users/", {
                                                  :email => email,
                                                  :password => password,
                                                  :password_confirmation => confirm_password,
                                                  :address => address
                                                })
    data = JSON.parse(response.body)
  end

  def self.sign_in(email,password)
    domain = Rails.application.config.domain
    response = Curl.post("#{domain}/api/v1/users/sign_in/", {
                                                  :email => email,
                                                  :password => password
                                                })
    data = JSON.parse(response.body)
  end

  def self.create_booking(seater_number,address,auth_token)
    domain = Rails.application.config.domain
    response = Curl.post("#{domain}/api/v1/bookings/", {
                                                  :auth_token     => auth_token,
                                                  :seater_number  => seater_number,
                                                  :address        => address
                                                })
    data = JSON.parse(response.body)
  end

  def self.show_booking(auth_token,booking_id)
    domain = Rails.application.config.domain
    response = Curl.get("#{domain}/api/v1/bookings/get_booking?auth_token=#{auth_token}&booking_id=#{booking_id}")
    data = JSON.parse(response.body)
  end

  def self.user_booking(auth_token)
    domain = Rails.application.config.domain
    response = Curl.get("#{domain}/api/v1/bookings/user_booking?auth_token=#{auth_token}")
    data = JSON.parse(response.body)
  end

end