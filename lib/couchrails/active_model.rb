require 'active_model/naming'

module CouchRails
  module ActiveModel


    module ClassMethods

      # Returns an ActiveModel::Name object for module. It can be
      # used to retrieve all kinds of naming-related information.
      def model_name
        @_model_name ||= ::ActiveModel::Name.new(self)
      end

    end

    module InstanceMethods

      def to_model
        self
      end

      def persisted?
        !self.new?
      end

      def to_key
        persisted? ? [self["_id"]] : nil
      end

      def to_param
        key = self.to_key
        return nil if key.nil?
        key.first.to_s
      end

      # Define the minimum requirements if the resource
      # has no concept of validation baked in.
      unless respond_to?(:validatable?)

        def valid?
          true
        end

        def errors
          obj = Object.new

          def obj.[](key)
            []
          end

          def obj.full_messages()
            []
          end

          obj
        end

      end
    end

  end

end