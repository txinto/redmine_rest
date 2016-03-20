require 'active_resource'

require_relative 'collections/base'

module RedmineRest
  module Models
    #
    # issue status model
    #
    class IssueStatus < ActiveResource::Base
      self.format = :xml
      self.collection_parser = Collections::Base

      def self.find(*args)
        fail('Issue statuses can be loaded as :all only') unless args.size == 1 && args.first == :all
        super
      end
    end
  end
end
