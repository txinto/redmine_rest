require 'active_resource'

module RedmineRest
  module Models
    #
    # User model
    #
    class User < ActiveResource::Base
      self.format = :xml

      def issues(params = {})
        params[:assigned_to_id] = id
        Issue.all params: params
      end
    end
  end
end
