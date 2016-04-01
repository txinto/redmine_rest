require_relative 'detail'

module RedmineRest
  module Models
    class Issue < ActiveResource::Base
      #
      # Class that represents issue journals.
      #
      # Redmine REST provides journals only through `/issues.xml?include=journals`,
      # so there's no reason to use active_resource
      #
      class Journal
        attr_accessor :id, :user, :notes,
                      :created_on, :details

        attr_reader :broken # for indication that something is wrong

        def initialize(params, _persisted)
          params.each { |attr, value| public_send("#{attr}=", value) }
        rescue
          @broken = true
        end

        def user=(value)
          @user = User.new(value, true)
        end

        def details=(value)
          value = [value] unless value.is_a? Array
          @details = value.map { |v| Detail.new(v) }
        end
      end
    end
  end
end
