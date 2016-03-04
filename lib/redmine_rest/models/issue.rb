require 'active_resource'

require_relative 'user'
require_relative 'project'
require_relative 'version'
require_relative 'collections/issue'

module RedmineRest
  module Models
    #
    # issue model
    #
    class Issue < ActiveResource::Base
      self.format = :xml
      self.collection_parser = Collections::Issue

      has_one :author, class_name: User
      has_one :assigned_to, class_name: User
      has_one :project, class_name: Project
      has_one :version, class_name: Version
    end
  end
end
