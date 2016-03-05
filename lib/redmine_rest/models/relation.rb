require 'active_resource'

module RedmineRest
  module Models
    #
    # Model of issue relations
    #
    class Relation < ActiveResource::Base
      TYPES = %w(relates duplicates duplicated blocks blocked precedes follows copied_to copied_from).freeze

      self.format = :xml

      validate :validate_relation_type,
               :validate_issue_id,
               :validate_issue_to_id

      def self.set_prefix
        self.prefix = '/issues/:issue_id'
      end

      set_prefix

      def self.find(what, options = {})
        fail('Redmine REST doesnt provide list of all relations') if what == :all
        self.prefix = '/'
        super
        set_prefix
      end

      private

      def validate_relation_type
        errors.add(:relation_type, 'Wrong relation type') unless relation_type? && TYPES.include?(relation_type)
      end

      def validate_issue_id
        errors.add(:issue_id, 'Issue ID required') unless issue_id?
      end

      def validate_issue_to_id
        errors.add(:issue_to_id, 'Issue ID required') unless issue_to_id?
      end
    end
  end
end
