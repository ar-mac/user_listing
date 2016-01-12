require 'rails_helper'

RSpec.describe User do
  it { is_expected.to validate_presence_of(:first_name) }
  it { is_expected.to validate_length_of(:first_name).is_at_least(2).is_at_most(20) }
  it { is_expected.to validate_presence_of(:last_name) }
  it { is_expected.to validate_length_of(:last_name).is_at_least(2).is_at_most(20) }
  it { is_expected.to validate_presence_of(:email) }
  # it { is_expected.to validate_length_of(:email).is_at_most(20) }
  it { is_expected.to allow_values('user1@example.com', '123guy_@company.eu').for(:email) }
  it { is_expected.not_to allow_values('user1example.com', '123guy_@company_eu').for(:email) }

end
