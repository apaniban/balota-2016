class PartyList < ActiveRecord::Base
  validates :name, presence: true
  validates :acronym, presence: true
  validates :ballot_number, presence: true, uniqueness: true,
    numericality: { only_integer: true, greater_than: 0 }
end
