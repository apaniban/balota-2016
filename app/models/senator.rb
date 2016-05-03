class Senator < ActiveRecord::Base
  validates :name, presence: true
  validates :ballot_name, presence: true
  validates :ballot_number, presence: true, uniqueness: true,
    numericality: { only_integer: true, greater_than: 0 }

  belongs_to :party
  has_and_belongs_to_many :checklists

  def name_with_ballot_number
    "#{ballot_number}: #{ballot_name}"
  end
end
