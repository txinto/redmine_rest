require 'active_resource'

module RedmineRest
  module Models
    module Collections
      #
      # Methods for project collections
      #
      class Project < ActiveResource::Collection
        include Helpers::Collection
      end
    end
  end
end
