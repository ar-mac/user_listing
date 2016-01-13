require 'rails_helper'

RSpec.describe UsersController do
  describe '#index' do
    let(:call_request) { get :index, params }
    let(:params) { {} }
    let!(:users) { create_list(:user, 3, :with_projects) }

    # is it required? I think that after each commit to database - searchkick index a created object on elasticsarch
    before { User.reindex }
    it_behaves_like 'an action rendering view'
  end

  describe '#new' do
    let(:call_request) { get :new }

    it_behaves_like 'an action rendering view'
    it { expect(controller.user).to be_a_new(User) }
  end

  describe '#create' do
    let(:call_request) { post :create, user: attributes }
    let(:attributes) { attributes_for(:user) }

    it_behaves_like 'an action redirecting to', -> { users_path }
    it_behaves_like 'an action creating object', :first_name

    context 'invalid params' do
      let(:attributes) { attributes_for(:user, first_name: '') }

      it_behaves_like 'an action rendering view' do
        let(:view) { 'new' }
      end
      it_behaves_like 'an action creating object', :first_name, expect_failure: true
    end
  end

  describe '#edit' do
    let(:call_request) { get :edit, id: user.id }
    let(:user) { create(:user) }

    it_behaves_like 'an action rendering view'
  end

  describe '#update' do
    let(:call_request) { put :update, id: user.id, user: attributes }
    let(:user) { create(:user) }
    let(:attributes) { attributes_for(:user) }

    it_behaves_like 'an action redirecting to', -> { users_path }
    it_behaves_like 'an action updating object', :name

    context 'invalid params' do
      let(:attributes) { attributes_for(:user, first_name: '') }

      it_behaves_like 'an action rendering view' do
        let(:view) { 'edit' }
      end
      it_behaves_like 'an action updating object', :name, expect_failure: true
    end
  end

  describe '#destroy' do
    let(:call_request) { delete :destroy, id: user.id }
    let(:user) { create(:user) }

    it_behaves_like 'an action destroying object'
    it_behaves_like 'an action redirecting to', -> { users_path }
  end
end
