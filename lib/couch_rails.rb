require 'active_support'
require 'active_model'
require 'couchrest'

module CouchRails
  extend ActiveSupport::Autoload
  
  autoload :AbstractClass, "couch_rails/support/abstract_class"
  autoload :Document #, "couchrails/document"
  autoload :Config #, "couchrails/config"
  autoload :Associations #, 'couchrails/associations'

  autoload_under "queries" do
    autoload :FinderMethods
  end

  autoload_under "active_model" do
    autoload :Naming
    autoload :Validations
  end


end
