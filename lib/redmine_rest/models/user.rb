require 'active_resource'

module RedmineRest
  module Models
    #
    # User model
    #
    class User < ActiveResource::Base
      self.format = :xml

      def self.find_by_name_or_mail(str)
        all_by_name_or_mail(str).first
      end

      def self.all_by_name_or_mail(str)
        find :all, params: { name: str }
      end

      def issues(params = {})
        params[:assigned_to_id] = id
        Issue.all params: params
      end
    end
  end
end
