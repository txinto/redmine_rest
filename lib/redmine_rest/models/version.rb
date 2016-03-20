require 'active_resource'

require_relative 'collections/version'

module RedmineRest
  module Models
    #
    # Version model
    #
    class Version < ActiveResource::Base
      self.format = :xml
      self.collection_parser = Collections::Version
      self.prefix = '/projects/:project_id/'

      #
      # Overrides parent method.
      # When we want to fetch one version, we need not to use prefix
      #
      def self.element_path(id, prefix_options = {}, query_options = nil)
        "/versions/#{URI.parser.escape id.to_s}#{format_extension}#{query_string(query_options)}"
      end
    end
  end
end
