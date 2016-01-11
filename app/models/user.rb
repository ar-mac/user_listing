class User < ActiveRecord::Base

  # in courtesy of http://www.regular-expressions.info/email.html
  EMAIL_REGEX = /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}\z/i

  has_and_belongs_to_many :projects

  validates :first_name,
            presence: true,
            length: { in: 2..20 }
  validates :last_name,
            presence: true,
            length: { in: 2..20 }
  validates :email,
            presence: true,
            format: { with: EMAIL_REGEX }

  scope :with_first_name, ->(name) { where(first_name: name) if name.present? }
  scope :with_last_name, ->(name) { where(last_name: name) if name.present? }
  scope :with_email, ->(email) { where(emial: email) if email.present? }
  scope :with_project, ->(id) { joins(:projects).where(projects: {id: id}) if id.present? }

  def self.by_search_params(params)
    with_first_name(params[:first_name])
    .with_last_name(params[:last_name])
    .with_email(params[:email])
    .with_project(params[:project_id])
  end

  def full_name
    [first_name, last_name].join(' ')
  end

  def to_s
    full_name
  end
end
