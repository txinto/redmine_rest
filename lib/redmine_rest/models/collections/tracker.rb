require 'active_resource'

module RedmineRest
  module Models
    module Collections
      #
      # Methods for tracker collections
      #
      class Tracker < ActiveResource::Collection
        include Helpers::Collection
      end
    end
  end
end
