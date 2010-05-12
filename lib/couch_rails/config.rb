module CouchRails
  class Config
    @db_map = {}
    class << self
      attr_accessor :db_map

      def db_for(model_name)
        db_name = @db_map[model_name.intern]
        db_name = model_name unless db_name
        db = CouchRest.database!(db_name.to_s)
        db
      end
    end

  end
end