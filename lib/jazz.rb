require 'active_support'
require 'rails/engine'

module Jazz
  extend ActiveSupport::Autoload

  VERSION = '0.1'  

  autoload :Helpers
  
  # Enable cool stuff
  class Engine < Rails::Engine
  end
end
