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
            format: { with: EMAIL_REGEX },
            length: { maximum: 40 }

  def self.search(search)
    joins(:projects).where("'users'.'first_name' LIKE :search OR 'users'.'last_name' LIKE :search OR 'users'.'email' LIKE :search OR 'projects'.'name' LIKE :search", search: search).distinct
  end

  # methods below normally would go to decorator, but because of the project size they wont
  def projects_list
    projects.to_sentence(two_words_connector: ', ', last_word_connector: ', ')
  end

  def full_name
    [first_name, last_name].join(' ')
  end

  def to_s
    full_name
  end
end
