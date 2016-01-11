class Project < ActiveRecord::Base

  has_and_belongs_to_many :users

  scope :active, -> { where(active: true) }

  def to_s
    name
  end
end
