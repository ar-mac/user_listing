class Project < ActiveRecord::Base

  has_and_belongs_to_many :users

  validates :name,
            presence: true,
            length: { in: 2..20 }

  scope :active, -> { where(active: true) }

  def to_s
    name
  end
end
