require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do

  describe '#new' do
    let(:call_request) { get :new }

    it_behaves_like 'an action rendering view'
    it { expect(controller.project).to be_a_new(Project) }
  end

  describe '#create' do
    let(:call_request) { post :create, project: attributes }
    let(:attributes) { attributes_for(:project) }

    it_behaves_like 'an action redirecting to', -> { users_path }
    it_behaves_like 'an action creating object', :name

    context 'invalid params' do
      let(:attributes) { {name: ''} }

      it_behaves_like 'an action rendering view' do
        let(:view) { 'new' }
      end
      it_behaves_like 'an action creating object', :name, expect_failure: true
    end
  end

  describe '#edit' do
    let(:call_request) { get :edit, id: project.id }
    let(:project) { create(:project) }

    it_behaves_like 'an action rendering view'
  end

  describe '#update' do
    let(:call_request) { put :update, id: project.id, project: attributes }
    let(:project) { create(:project) }
    let(:attributes) { attributes_for(:project) }

    it_behaves_like 'an action redirecting to', -> { users_path }
    it_behaves_like 'an action updating object', :name

    context 'invalid params' do
      let(:attributes) { {name: ''} }

      it_behaves_like 'an action rendering view' do
        let(:view) { 'edit' }
      end
      it_behaves_like 'an action updating object', :name, expect_failure: true
    end
  end

  describe '#destroy' do
    let(:call_request) { delete :destroy, id: project.id }
    let(:project) { create(:project) }

    it_behaves_like 'an action destroying object'
    it_behaves_like 'an action redirecting to', -> { users_path }
  end


end
