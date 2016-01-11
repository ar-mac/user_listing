require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do

  describe '#new' do
    let(:call_request) { get :new }

    it_behaves_like 'an action rendering view'
  end

end
