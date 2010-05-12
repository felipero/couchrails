module CouchRails
  module Validations
    def self.included(subclass)
      subclass.instance_eval do
        include ActiveModel::Validations
      end
    end

  end
end