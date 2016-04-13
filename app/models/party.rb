class Party < ActiveRecord::Base
  validates :name, presence: true
  validates :acronym, presence: true

  has_many :presidents
  has_many :vice_presidents
end
