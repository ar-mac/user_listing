class Project < ActiveRecord::Base

  has_and_belongs_to_many_with_deferred_save :users

  validates :name,
            presence: true,
            length: { in: 2..20 }

  scope :active, -> { where(active: true) }

  def to_s
    name
  end
end
