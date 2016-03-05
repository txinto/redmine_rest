require 'active_resource'

require_relative 'user'
require_relative 'project'
require_relative 'version'
require_relative 'relation'
require_relative 'collections/issue'

module RedmineRest
  module Models
    #
    # issue model
    #
    class Issue < ActiveResource::Base
      self.format = :xml
      self.collection_parser = Collections::Issue

      has_one :author, class_name: User
      has_one :assigned_to, class_name: User
      has_one :project, class_name: Project
      has_one :version, class_name: Version
      has_one :parent, class_name: Issue
      has_many :children, class_name: Issue
      has_many :watchers, class_name: User
      has_many :relations, class_name: Relation

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
          params[:include] += ',journals,relations,children,watchers'
        else # doubling is not bad
          params[:include] = 'journals,relations,children,watchers'
        end

        super(what, options)
      end

      #
      # Methods for necessery attributes.
      #
      # I guess it's equal to `.<attribute>?`
      #
      [:author, :assigned_to, :project, :version, :children, :watchers, :relations, :parent].each do |attr|
        define_method(attr) do
          attributes[attr]
        end
      end
    end
  end
end
