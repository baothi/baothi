class Api::V1::UsersController < Api::V1::BaseApiController
  skip_before_filter :api_authenticate_user!
end