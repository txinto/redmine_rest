require 'active_resource'

module RedmineRest
  module Models
    #
    # Project model
    #
    class Project < ActiveResource::Base
      self.format = :xml
    end
  end
end
