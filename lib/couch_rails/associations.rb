module CouchRails
  module Associations

    def self.included(base)
      base.extend(ClassMethods)
    end
    
    module ClassMethods
      def has_one(document, options ={})
        
      end
      def belongs_to(document, options ={})
        property = CouchRest::Property.new(document, options)
        create_property_getter_belongs_to(property)
        create_property_setter_belongs_to(property)
        self.properties << property
      end
      protected
        def create_property_getter_belongs_to(property)
             class_eval <<-EOS
              def #{property.name}
                eval "#{property.name}".camelcase.find(self['#{property.name}'])
              end
            EOS
        end
        def create_property_setter_belongs_to(property)
             class_eval <<-EOS
              def #{property.name}=(document_instance)
                self['#{property.name}'] = document_instance.to_key
              end
            EOS
        end
    end
  end
end