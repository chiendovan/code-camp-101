class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :authenticate_user!

  def prepare_renderer_for_devise
    renderer = ApplicationController.renderer.new
    warden = request.env['warden']
    renderer.instance_variable_set(:@env, { 
      'warden' => warden,
      'devise.mapping' => Devise.mappings[:user]
    })
    renderer
  end
end
