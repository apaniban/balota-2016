class Party < ActiveRecord::Base
  validates :name, presence: true
  validates :acronym, presence: true
end
