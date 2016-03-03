require 'active_resource'

module RedmineRest
  module Models
    #
    # TimeEntry model
    #
    class TimeEntry < ActiveResource::Base
      self.format = :xml
    end
  end
end
