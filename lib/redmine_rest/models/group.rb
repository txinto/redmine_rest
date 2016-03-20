require 'active_resource'

require_relative 'collections/base'

module RedmineRest
  module Models
    #
    # Group model. Right now it cant work with user lists (add, delete and so on)
    #
    class Group < ActiveResource::Base
      self.format = :xml
      self.collection_parser = Collections::Base
    end
  end
end
