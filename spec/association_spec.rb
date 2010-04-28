require 'spec_helper'

describe "Defining possible associations between documents" do
       it "should be able to Instanciate a document with simple association" do
         @associated_doc = Models::AssociatedDoc.new
         @associated_doc.name = "Name"
         @associated_doc.save.should be == true

         @doc = Models::DocWithAssociations.new
         @doc.respond_to? :associatedDoc
         @doc.associatedDoc = @associated_doc
         @doc.save.should be == true

         findedObj = Models::DocWithAssociations.get(@doc["_id"])
         findedObj.respond_to? :associatedDoc
         puts findedObj.associatedDoc
      #   findedObj.associatedDoc.to_key.should be == @associated_doc.to_key

       end

      it "should be able to cascade save for child node" do
        @ass_obj = Models::AssociatedDoc.new
        @doc = Models::DocWithAssociations.new

        @ass_obj.docWithAssociation = @doc
        @ass_obj.save.should be == true
        @doc.to_key.should be != nil

      end
end