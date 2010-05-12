module CouchRails
  module FinderMethods

    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods

      def find(id)
        get(id, db)
      end

      def get(id, db = database)
        begin
          get!(id, db)
        rescue
          nil
        end
      end
    end
  end
end