require 'active_resource'

module RedmineRest
  module Models
    #
    # Model of issue relations
    #
    class Relation < ActiveResource::Base
      TYPES = %w(relates duplicates duplicated blocks blocked precedes follows copied_to copied_from).freeze

      self.format = :xml
      self.prefix = '/issues/:issue_id/'

      validate :validate_relation_type,
               :validate_issue_id,
               :validate_issue_to_id

      #
      # Overrides parent method.
      # When we want to fetch one relation, we need not to use prefix
      #
      def self.element_path(id, prefix_options = {}, query_options = nil)
        "/relations/#{URI.parser.escape id.to_s}#{format_extension}#{query_string(query_options)}"
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
