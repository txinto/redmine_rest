require 'active_resource'
require 'unicode'

module RedmineRest
  module Models
    module Collections
      #
      # Base class for most custom collections
      #
      class Base < ActiveResource::Collection
        def filter_by_name_substring(str)
          str = Unicode.downcase(str)
          self.class.new @elements.find_all { |e| Unicode.downcase(e.name).include? str }
        end
      end
    end
  end
end
