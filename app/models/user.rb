class User < ActiveRecord::Base

  has_and_belongs_to_many :projects

  scope :with_first_name, ->(name) { where(first_name: name) if name.present? }
  scope :with_last_name, ->(name) { where(last_name: name) if name.present? }
  scope :with_email, ->(email) { where(emial: email) if email.present? }

  def self.by_search_params(params)
    with_first_name(params[:first_name])
    .with_last_name(params[:last_name])
    .with_email(params[:email])
  end
end
