require 'active_resource'
require 'unicode'

module RedmineRest
  module Helpers
    #
    # some methods for ActiveResource collections
    #
    module Collection
      def filter_by_name_substring(str)
        str = Unicode.downcase(str)
        self.class.new @elements.find_all { |e| Unicode.downcase(e.name).include? str }
      end
    end
  end
end
