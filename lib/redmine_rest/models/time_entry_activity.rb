require 'active_resource'

require_relative 'collections/base'

module RedmineRest
  module Models
    #
    # time entry activity model
    #
    class TimeEntryActivity < ActiveResource::Base
      self.format = :xml
      self.collection_parser = Collections::Base
      self.prefix = '/enumerations/'

      def self.find(*args)
        fail('Issue priorities can be loaded as :all only') unless args.size == 1 && args.first == :all
        super
      end
    end
  end
end
