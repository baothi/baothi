class Api::V1::DriversController < Api::V1::BaseApiController
  before_filter :api_authenticate_user!, :except => [:update_status]


  api :PUT, 'v1/drivers/update_status', 'Update current status of driver'
  param :current_status, :number, :desc => "busy: 1, free: 2", :required => true
  param :driver_code, String, :desc => "free: 2, busy: 1", :required => true
  def update_status
    required :current_status, :driver_code
    driver = Driver.find_by_driver_code(params[:driver_code])
    if driver
      driver.update_attribute("status", params[:current_status].to_i)
      render json: {
                      :status   => 200,
                      :message  => "Successfully",
                      :driver   => driver
                    }
    else
      render json: {
                      :status   => 400,
                      :message  =>  "Successfully",
                      :error    => "Driver is not existing"
                    }
    end
  end

end