require 'active_resource'

module RedmineRest
  module Models
    module Collections
      #
      # Methods for version collections
      #
      class Version < ActiveResource::Collection
        include Helpers::Collection
      end
    end
  end
end
