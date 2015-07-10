class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   #CALLBACKS
  before_save :ensure_authentication_token

  # input latitude and longitude. Auto generate address and fill to gps_location field  in database
  reverse_geocoded_by :latitude, :longitude, :address => :address
  after_validation :reverse_geocode

  # input gps_location. Auto generate latitude and longitude
  geocoded_by :address, :latitude => :latitude, :longitude => :longitude
  after_validation :geocode, :reverse_geocode

  has_many :bookings

  def as_json(options = {})
    # super.merge :auth_token => authentication_token
    {
      :id           => self.id,
      :email        => self.email,
      :is_online    => self.is_online,
      :auth_token   => self.authentication_token
    }
  end
  def ensure_authentication_token
    if authentication_token.blank?
      self.authentication_token = generate_authentication_token
    end
  end

  def reset_authentication_token!
    self.authentication_token = generate_authentication_token
    self.save(validate: false)
  end

  private
  def generate_authentication_token
    loop do
      token = Devise.friendly_token
      break token unless User.where(authentication_token: token).first
    end
  end
  
end
