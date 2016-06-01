module DeviseHelper
  module ControllerHelper
    def set_devise_mapping
      @request.env['devise.mapping'] = Devise.mappings[:user]
    end

    def login_user(factory_name = :user)
      @request.env['devise.mapping'] = Devise.mappings[:user]
      user = create(factory_name)
      sign_in user
    end
  end

  module ViewHelper
    def set_current_user(user)
      allow(view).to receive(:current_user).and_return(user)
    end
  end
end

RSpec.configure do |config|
  config.include Devise::TestHelpers, type: :controller
  config.include DeviseHelper::ControllerHelper, type: :controller
  config.include DeviseHelper::ViewHelper, type: :view
end
