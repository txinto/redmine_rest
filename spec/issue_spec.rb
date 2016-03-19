require 'spec_helper'

RSpec.describe Issue do
  context 'during validation' do
    before :each do
      @issue = Issue.new
    end

    it('checks tracker_id presence') { presence_validation_spec(@issue, :tracker_id, 1) }
    it('checks subject presence') { presence_validation_spec(@issue, :subject, 'some subject') }
  end
end
