require 'active_resource'

module RedmineRest
  module Models
    #
    # issue status model
    #
    class IssueStatus < ActiveResource::Base
      self.format = :xml
    end
  end
end
