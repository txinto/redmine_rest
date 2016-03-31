require 'active_resource'

require_relative 'collections/base'

module RedmineRest
  module Models
    #
    # attachments model
    #
    class Attachment < ActiveResource::Base
      self.format = :xml
      self.collection_parser = Collections::Base
    end
  end
end
