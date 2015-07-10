class Driver < ActiveRecord::Base
  before_create :generate_driver_code

  has_many :bookings

  # input latitude and longitude. Auto generate address and fill to gps_location field  in database
  reverse_geocoded_by :latitude, :longitude, :address => :address
  after_validation :reverse_geocode

  # input gps_location. Auto generate latitude and longitude
  geocoded_by :address, :latitude => :latitude, :longitude => :longitude
  after_validation :geocode, :reverse_geocode


  STATUS = {
    :free    => 0,
    :busy    => 1
  }

  GENDER = {
    :female   => 0,
    :male     => 1
  }

  GENDER_NAME = {
    0    => "Female",
    1    => "Male"
  }

  def as_json(options = {})
    {
      :id             => self.id,
      :name           => self.name,
      :gender         => GENDER_NAME[self.gender],
      :birthday       => self.birthday,
      :phone_number   => self.phone_number,
      :taxi_number    => self.taxi_number,
      :company        => self.company,
      :seater_number  => self.sit_number,
      :latitude       => self.latitude, 
      :longitude      => self.longitude,
      :address        => self.address
    }
  end
  

  def self.rand_code
    sql = "SELECT *
            FROM  (
                SELECT generate_series(10000, 99999) AS code
                  EXCEPT (select driver_code::integer from drivers)
            ) rand_codes LIMIT 1"
    result = connection.execute sql
    code = result.as_json.first["code"]
  end
  
  def generate_driver_code
    self.driver_code = Driver.rand_code
  end
end
