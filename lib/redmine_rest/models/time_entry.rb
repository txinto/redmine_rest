require 'active_resource'

module RedmineRest
  module Models
    #
    # TimeEntry model
    #
    # *WARNING:*
    #
    # You have to define activity_id if you wanna create TimeEntry.
    # Or you should set default activity in Redmine administration.
    #
    class TimeEntry < ActiveResource::Base
      self.format = :xml
    end
  end
end
