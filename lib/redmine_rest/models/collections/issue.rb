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

        def group_by_author
          group_by(&:author)
        end

        def group_by_assigned_to
          group_by(&:assigned_to)
        end
      end
    end
  end
end
