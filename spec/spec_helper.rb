begin
  # Just in case the bundle was locked
  # This shouldn't happen in a dev environment but lets be safe
  require File.expand_path('../../.bundle/environment', __FILE__)
rescue LoadError
  require 'rubygems'
  require 'bundler'
  Bundler.setup
end
Bundler.require(:default, :test)

lib = File.expand_path('../../lib', __FILE__)
$LOAD_PATH.unshift(lib) if File.directory?(lib)

# Use local active_model if running from a typical dev checkout.
lib = File.expand_path('../../../rails/activemodel/lib', __FILE__)
$LOAD_PATH.unshift(lib) if File.directory?(lib)
require 'active_model/lint'

require "couchrails"
require "amo_compliance_spec"

require "models"
