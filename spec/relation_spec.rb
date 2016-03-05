require 'spec_helper'

RSpec.describe Relation do
  context 'after clear validation' do
    before :each do
      @relation = Relation.new
      @relation.validate
    end

    it 'don\'t like relation_type' do
      expect(@relation.errors.key?(:relation_type)).to be true
    end

    it 'requires :issue_id' do
      expect(@relation.errors.key?(:issue_id)).to be true
    end

    it 'requires :issue_to_id' do
      expect(@relation.errors.key?(:issue_to_id)).to be true
    end
  end
end
