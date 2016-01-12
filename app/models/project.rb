class Project < ActiveRecord::Base

  has_and_belongs_to_many :users

  validates :name,
            presence: true,
            length: { in: 2..20 }

  after_commit :reindex_users

  scope :active, -> { where(active: true) }

  def to_s
    name
  end

  private

  def reindex_users
    User.reindex
  end
end
