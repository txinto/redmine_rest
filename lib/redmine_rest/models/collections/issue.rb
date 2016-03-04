require 'active_resource'

module RedmineRest
  module Models
    module Collections
      #
      # Methods for issue collections
      #
      class Issue < ActiveResource::Collection
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
    end
  end
end
