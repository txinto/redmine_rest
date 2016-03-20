require 'active_resource'

module RedmineRest
  module Models
    module Collections
      #
      # Methods for priority collections
      #
      class IssuePriority < ActiveResource::Collection
        include Helpers::Collection
      end
    end
  end
end
