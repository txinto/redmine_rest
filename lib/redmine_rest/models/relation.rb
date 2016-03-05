require 'active_resource'

module RedmineRest
  module Models
    #
    # Model of issue relations
    #
    class Relation < ActiveResource::Base
      self.format = :xml

      def self.find(what, options = {})
        fail('Redmine REST doesnt provide list of all relations') if what == :all

        super
      end
    end
  end
end
