require 'active_resource'

require_relative 'user'
require_relative 'project'
require_relative 'version'
require_relative 'relation'
require_relative 'tracker'
require_relative 'attachment'
require_relative 'collections/issue'
require_relative 'issue/journal'

module RedmineRest
  module Models
    #
    # issue model
    #
    class Issue < ActiveResource::Base
      self.format = :xml
      self.collection_parser = Collections::Issue

      has_one :tracker, class_name: Tracker
      has_one :author, class_name: User
      has_one :assigned_to, class_name: User
      has_one :project, class_name: Project
      has_one :fixed_version, class_name: Version
      has_one :parent, class_name: Issue
      has_many :children, class_name: Issue
      has_many :watchers, class_name: User
      has_many :relations, class_name: Relation
      has_many :attachments, class_name: Attachment
      has_many :journals, class_name: Journal

      validates :subject, :tracker_id, presence: true

      def tracker_id
        attributes[:tracker_id] || tracker? && tracker.id
      end

      #
      # Adds journals, relations, children and watchers to request.
      #
      # Be careful, even if issue has watchers, it won't be loaded,
      # because REST API can load them only after v2.3.0 (see Redmine docs)
      #
      def self.find(what, options = {})
        options[:params] = {} unless options[:params]
        params = options[:params]

        if params[:include]
          params[:include] += ',journals,relations,children,watchers,attachments'
        else # doubling is not bad
          params[:include] = 'journals,relations,children,watchers,attachments'
        end

        super(what, options)
      end

      def version
        fixed_version
      end

      #
      # Sets #fixed_version_id via Version object.
      #
      def fixed_version=(version)
        fail ArgumentError unless version.is_a? Version
        self.fixed_version_id = version.id
      end

      alias_method 'version=', 'fixed_version='

      #
      # Sets #tracker_id via Tracker object.
      #
      def tracker=(tracker)
        fail ArgumentError unless tracker.is_a? Tracker
        self.tracker_id = tracker.id
      end

      #
      # Sets #project_id via Project object.
      #
      def project=(project)
        fail ArgumentError unless project.is_a? Project
        self.project_id = project.id
      end

      #
      # Sets #assigned_to_id via User object
      #
      def assigned_to=(user)
        fail ArgumentError unless user.is_a? User
        self.assigned_to_id = user.id
      end

      #
      # Sets #parent_issue_id via Issue object
      #
      def parent=(issue)
        fail ArgumentError unless issue.is_a? Issue
        self.parent_issue_id = issue.id
      end

      def method_missing(method, *args)
        return super if block_given? || method.to_s.end_with?('?') || !args.empty?
        attributes[method]
      end
    end
  end
end
