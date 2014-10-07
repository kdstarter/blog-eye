 
 module ControllerHelpers
  def current_user
    user = User.find_by(email: attributes_for(:valid_user)[:email])
    user || create(:valid_user)
  end

  def sign_in(user = current_user)
    if user.nil?
      allow(request.env['warden']).to receive(:authenticate!).and_throw(:warden, {:scope => :user})
      allow(controller).to receive(:current_user).and_return(nil)
    else
      allow(request.env['warden']).to receive(:authenticate!).and_return(user)
      allow(controller).to receive(:current_user).and_return(user)
    end
  end
end

RSpec.configure do |config|
  # See https://github.com/plataformatec/devise/wiki/How-To:-Stub-authentication-in-controller-specs
  config.include Devise::TestHelpers, :type => :controller
  config.include ControllerHelpers, :type => :controller
end
