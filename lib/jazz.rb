require 'active_support'

module Jazz
  extend ActiveSupport::Autoload

  VERSION = "0.0.1"  

  autoload :Helpers
  autoload :FormHelpers  

end
