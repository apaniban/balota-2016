class Checklist < ActiveRecord::Base
  belongs_to :president
  belongs_to :vice_president
  belongs_to :party_list
end
