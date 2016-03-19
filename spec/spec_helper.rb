$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'redmine_rest'

include RedmineRest::Models

def presence_validation_spec(object, attribute, attr_value)
  object.validate
  expect(object.errors.keys).to include attribute

  object.send(:"#{attribute}=", attr_value)
  object.validate
  expect(object.errors.keys).not_to include attribute
end
