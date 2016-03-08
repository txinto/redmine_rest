require 'active_resource'

require_relative 'collections/project'

module RedmineRest
  module Models
    #
    # Project model
    #
    class Project < ActiveResource::Base
      self.format = :xml
      self.collection_parser = Collections::Project
    end
  end
end
