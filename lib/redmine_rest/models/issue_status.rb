require 'active_resource'

module RedmineRest
  module Models
    #
    # issue status model
    #
    class IssueStatus < ActiveResource::Base
      self.format = :xml

      def self.find(*args)
        fail('Issue statuses can be loaded as :all only') unless args.size == 1 && args.first == :all

        return @statuses if @statuses
        @statuses = super
      end
    end
  end
end
