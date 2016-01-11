class Project < ActiveRecord::Base

  has_and_belongs_to_many :users

  after_commit :reindex_users

  scope :active, -> { where(active: true) }

  def to_s
    name
  end

  def reindex_users
    users.reindex
  end
end
