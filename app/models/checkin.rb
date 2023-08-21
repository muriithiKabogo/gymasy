class Checkin < ApplicationRecord
  belongs_to :member
  belongs_to :gym
end
