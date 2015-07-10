class Api::V1::Docs::BookingsDoc <  ActionController::Base

  def self.user_booking
    <<-EOS
      {
        status: 200
        message: "Successfully"
        bookings: [2]
          0:  {
            id: 6
            user: {
              id: 5
              email: "thitestapi4@aa.vn"
              is_online: true
              auth_token: "iUwh_eiFWc2Piuvycb3n"
            }-
            driver: {
              id: 9
              name: "Global Group Technician"
              gender: "Male"
              birthday: "1990-01-01T00:00:00.000Z"
              phone_number: "2390215646"
              taxi_number: "94773"
              company: "Kshlerin-Kohler"
              seater_number: 7
              latitude: 10.7778445
              longitude: 106.6896354
              address: "97-103 Trương Định, phường 6, District 3, Ho Chi Minh City, Vietnam"
            }-
            status: 0
            latitude: 10.7915425
            longitude: 106.6971481
            address: "55 Nguyễn Văn Giai, Đa Kao, Quận 1, Ho Chi Minh City, Vietnam"
            created_at: "2014-06-18T11:13:49.007Z"
          }-
          1:  {
            id: 14
            user: {
              id: 5
              email: "thitestapi4@aa.vn"
              is_online: true
              auth_token: "iUwh_eiFWc2Piuvycb3n"
            }-
            driver: {
              id: 1
              name: "Future Data Facilitator"
              gender: "Male"
              birthday: "1990-01-01T00:00:00.000Z"
              phone_number: "8414197874"
              taxi_number: "23478"
              company: "Barton-Baumbach"
              seater_number: 7
              latitude: 10.7715649
              longitude: 106.6975236
              address: "10 Lê Lai, Bến Thành, Quận 1, Ho Chi Minh City, Vietnam"
            }-
            status: 0
            latitude: 10.7700946
            longitude: 106.6938972
            address: "80 Lê Lai, Bến Thành, Quận 1, Ho Chi Minh City, Vietnam"
            created_at: "2014-06-18T11:13:49.007Z"
          }-
        }
    EOS
  end

  def self.create
    <<-EOS
      {
        status: 200
        message: "Successfully"
        booking: {
          id: 4
          user: {
            id: 11
            email: "thitestapi10@aa.vn"
            is_online: true
            auth_token: "nd6AmVaqf1Y_xZcw8aLH"
          }-
          driver: {
            id: 2
            name: "Internal Tactics Officer"
            gender: 0
            birthday: "1990-01-01T00:00:00.000Z"
            phone_number: "0173947464"
            taxi_number: "76529"
            company: "King-Schulist"
            seater_number: 4
            latitude: 10.7915425
            longitude: 106.6971481
            address: "50 Pasture, Quận 1, Ho Chi Minh City, Vietnam"
          }-
          status: 0
          latitude: 10.7915425
          longitude: 106.6971481
          address: "55 Nguyễn Văn Giai, Đa Kao, Quận 1, Ho Chi Minh City, Vietnam"
          created_at: "2014-06-18T11:13:49.007Z"
        }        
      }
    EOS
  end

  def self.get_booking
    <<-EOS
      {
        status: 200
        message: "Successfully"
        booking: {
          id: 5
          user: {
            id: 11
            email: "thitestapi10@aa.vn"
            is_online: true
            auth_token: "nd6AmVaqf1Y_xZcw8aLH"
          }-
          driver: {
            id: 2
            name: "Internal Tactics Officer"
            gender: 0
            birthday: "1990-01-01T00:00:00.000Z"
            phone_number: "0173947464"
            taxi_number: "76529"
            company: "King-Schulist"
            seater_number: 4
            latitude: 10.7915425
            longitude: 106.6971481
            address: "55 Nguyễn Văn Giai, Đa Kao, Quận 1, Ho Chi Minh City, Vietnam"
          }-
          status: 0
          latitude: 10.7915425
          longitude: 106.6971481
          address: "55 Nguyễn Văn Giai, Đa Kao, Quận 1, Ho Chi Minh City, Vietnam"
          created_at: "2014-06-18T11:13:49.007Z"
        }
      }
    EOS
  end

end
