Dir[File.expand_path('../models/*.rb', __FILE__)].each { |f| require f }

module RedmineRest
  #
  # Namespace for models + some self-methods
  #
  module Models
    LIST = [Issue, User, Project, IssueStatus, TimeEntry, Tracker, Relation, Version].freeze

    def self.configure_models(params)
      ModelConfigurator.new.configure_models(params)
    end

    #
    # Class for self-methods. Dont use it outside this module
    #
    class ModelConfigurator
      def configure_models(params)
        site = params[:site] || Issue.site
        user = user_for_models(params)
        password = params.key?(:password) ? params[:password] : Issue.password

        change_models_params site: site,
                             user: user,
                             password: password
      end

      private

      def change_models_params(params)
        Models::LIST.each do |m|
          m.site = params[:site]
          m.user = params[:user]
          m.password = params[:password]
        end
      end

      def user_for_models(params)
        fail(ArgumentError, 'user + apikey was given') if params[:user] && params[:apikey]
        params[:user] || params[:apikey] || Issue.user
      end
    end
  end
end
