require 'active_resource'

module RedmineRest
  module Models
    module Collections
      #
      # Methods for issue collections
      #
      class Issue < ActiveResource::Collection
        #
        # GROUPING
        #

        # By project

        def group_by_project
          group_by(&:project)
        end

        def group_by_project_name
          group_by { |i| i.project.name }
        end

        def group_by_project_id
          group_by { |i| i.project.id }
        end

        # By author

        def group_by_author
          group_by(&:author)
        end

        def group_by_author_name
          group_by { |i| i.author.name }
        end

        def group_by_author_id
          group_by { |i| i.author.id }
        end

        # By assigned_to

        def group_by_assigned_to
          group_by(&:assigned_to)
        end

        def group_by_assigned_to_name
          group_by { |i| i.assigned_to.name }
        end

        def group_by_assigned_to_id
          group_by { |i| i.assigned_to.id }
        end
      end
    end
  end
end
