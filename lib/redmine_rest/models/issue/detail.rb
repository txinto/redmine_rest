require 'active_model'

module RedmineRest
  module Models
    class Issue < ActiveResource::Base
      class Journal
        #
        # Journal detail
        #
        class Detail
          include ActiveModel::Model
          attr_accessor :property, :name, :old_value, :new_value

          def attribute?
            property == 'attr'
          end

          def relation?
            property == 'relation'
          end

          def to_s
            if attribute?
              "#{name}: #{old_value.nil? ? 'nil' : old_value} -> #{new_value.nil? ? 'nil' : new_value}"
            elsif relation?
              "#{name} #{new_value}"
            else
              super
            end
          end
        end
      end
    end
  end
end
