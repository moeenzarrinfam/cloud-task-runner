class Environment < ApplicationRecord
  scope :active, -> { where(active: true) }

  has_many :tasks
end
