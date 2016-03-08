require 'active_resource'

require_relative 'collections/issue_status'

module RedmineRest
  module Models
    #
    # issue status model
    #
    class IssueStatus < ActiveResource::Base
      self.format = :xml
      self.collection_parser = Collections::IssueStatus

      def self.find(*args)
        fail('Issue statuses can be loaded as :all only') unless args.size == 1 && args.first == :all

        return @statuses if @statuses
        @statuses = super
      end
    end
  end
end
