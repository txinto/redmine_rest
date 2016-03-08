require 'active_resource'

module RedmineRest
  module Models
    module Collections
      #
      # Methods for status collections
      #
      class IssueStatus < ActiveResource::Collection
        include Helpers::Collection
      end
    end
  end
end
