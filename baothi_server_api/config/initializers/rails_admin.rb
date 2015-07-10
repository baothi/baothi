RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
  config.model 'User' do
    list do
      field :id
      field :email
      field :authentication_token
      field :is_online
      field :latitude
      field :longitude
      field :address
    end
  end

  config.model 'Driver' do
    list do
      field :id
      field :name
      field :status
      field :driver_code
      field :phone_number
      field :sit_number
      field :taxi_number
      field :gender
    end
  end
end
