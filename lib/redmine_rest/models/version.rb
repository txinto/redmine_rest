require 'active_resource'

require_relative 'collections/version'

module RedmineRest
  module Models
    #
    # Version model
    #
    class Version < ActiveResource::Base
      self.format = :xml
      self.collection_parser = Collections::Version

    end
  end
end
