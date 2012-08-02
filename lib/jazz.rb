require 'active_support'
require 'rails/engine'

module Jazz
  extend ActiveSupport::Autoload

  VERSION = '0.1'  

  autoload_under 'bootstrap' do
    autoload :Helpers
    autoload :FormHelpers
  end
  
  # Enable cool stuff
  class Engine < Rails::Engine
  end
end
