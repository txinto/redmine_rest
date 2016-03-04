require 'active_resource'

require_relative 'user'
require_relative 'project'
require_relative 'version'

module RedmineRest
  module Models
    #
    # issue model
    #
    class Issue < ActiveResource::Base
      self.format = :xml
      has_one :author, class_name: User
      has_one :assigned_to, class_name: User
      has_one :project, class_name: Project
      has_one :version, class_name: Version

      #
      # methods for collections
      #
      class IssueCollection < ActiveResource::Collection
        def group_by_project
          group_by(&:project)
        end

        def group_by_project_name
          group_by { |i| i.project.name }
        end

        def group_by_project_id
          group_by { |i| i.project.id }
        end
      end

      self.collection_parser = IssueCollection
    end
  end
end
