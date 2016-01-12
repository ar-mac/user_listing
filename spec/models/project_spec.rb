require 'rails_helper'

RSpec.describe Project do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_length_of(:name).is_at_least(2).is_at_most(20) }
  it { is_expected.to callback(:reindex_users).after(:commit) }

  describe 'self#active' do
    let(:scoped_projects) { Project.active }
    let!(:active_projects) { create_list(:project, 2) }
    let!(:inactive_projects) { create(:project, :inactive) }

    it { expect(scoped_projects).not_to include(inactive_projects) }
  end

  describe '#to_s' do
    let(:method) { project.to_s }
    let(:project) { create(:project, name: 'Project #1') }

    it { expect(method).to eql(project.name)}
  end
end
