CouchRails is a Object Document Mapper for CouchDB that implements the new Rails 3 ActiveModel.
It uses CouchRest.

[![Code Climate](https://codeclimate.com/github/felipero/couchrails/badges/gpa.svg)](https://codeclimate.com/github/felipero/couchrails)

Here are what it does right now:

CouchRails::Config
- should create a db based on model_name the model is not on the map
- should use the provided name

An active_model compliant CouchRails::ActiveModel
- must implement the #to_key interface
- must implement the #to_param interface
- must implement the #valid? interface
- must implement the #persisted? interface
- must implement the #model_naming interface
- must implement the #errors interface

An active_model compliant CouchRails::ActiveModel persisted?
- should be persisted after saved
- should not be persisted when created

An active_model compliant CouchRails::ActiveModel to_key
- should return the _id as key for persisted document
- should return nil as the key for new document
- should allow user specify which field will be the key
- should return nil when the object is new, even when there is a field specified as the key

An active_model compliant CouchRails::ActiveModel to_param
- should resolve to the first item of to_key result when the document is persisted
- should resolve to nil when the document is new

An active_model compliant CouchRails::ActiveModel initialization
- should set a database with a default name on the initialization
- should initialize a model with the correct db name from config


This project is under MIT License
