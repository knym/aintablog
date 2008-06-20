# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base

  before_filter :add_theme_path
  
  include AuthenticatedSystem
  
  helper :all # include all helpers, all the time
  
  filter_parameter_logging :password, :password_confirmation

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery :secret => '88b98c68052725f207bad5c1aec2355a'

  def add_theme_path
    self.prepend_view_path "#{RAILS_ROOT}/themes/#{SITE_SETTINGS['theme']}"
  end
  
end
