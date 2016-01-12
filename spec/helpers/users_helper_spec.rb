require 'rails_helper'

RSpec.describe UsersHelper do
  describe '#params_for_column_ordering' do
    let(:method) { params_for_column_ordering(column_key) }

    context 'first_name column' do
      let(:column_key) { :first_name }

      it { expect(method).to include({order: {first_name: 'desc'}}) }

      context 'descending ordering in params' do
        let(:params) { {order: {first_name: 'desc'}} }

        it { expect(method).to include({order: {first_name: 'asc'}}) }
      end
    end
  end
end
