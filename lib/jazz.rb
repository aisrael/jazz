require 'active_support'
require 'rails/engine'

module Jazz
#  extend ActiveSupport::Autoload

  VERSION = '0.4.1'

# autoload :FormHelpers
# 
  # autoload_under 'bootstrap' do
    # autoload :Helpers
    # autoload :FormHelpers
  # end

  # Magically enable cool stuff
  class Engine < Rails::Engine
  end
end
