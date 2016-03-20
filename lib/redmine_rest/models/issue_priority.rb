require 'active_resource'

require_relative 'collections/issue_priority'

module RedmineRest
  module Models
    #
    # issue priority model
    #
    class IssuePriority < ActiveResource::Base
      self.format = :xml
      self.collection_parser = Collections::IssuePriority
      self.prefix = '/enumerations/'

      def self.find(*args)
        fail('Issue priorities can be loaded as :all only') unless args.size == 1 && args.first == :all
        super
      end
    end
  end
end
