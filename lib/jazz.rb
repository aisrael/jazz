require 'rails'
require 'active_support'
require 'rails/engine'

module Jazz
  VERSION = '0.5'

  # Magically enable cool stuff
  class Engine < Rails::Engine
  end
end
