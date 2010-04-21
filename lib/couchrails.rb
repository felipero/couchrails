require 'active_support'
require 'active_model'
require 'couchrails/active_model/naming'
require 'couchrails/active_model/validation'
require 'couchrest'

module CouchRails
  autoload :AbstractClass, "couchrails/support/abstract_class"
  autoload :Document, "couchrails/core/document"
  autoload :Config, "couchrails/core/config"
end
