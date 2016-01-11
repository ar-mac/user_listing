class User < ActiveRecord::Base
  searchkick

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

  def search_data
    {
        first_name: first_name,
        last_name: last_name,
        email: email,
        projects: projects.map(&:name)
    }
  end

  def full_name
    [first_name, last_name].join(' ')
  end

  def to_s
    full_name
  end
end
