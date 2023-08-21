class MembershipType < ApplicationRecord
  belongs_to :gym
  belongs_to :admin

  validates :membership_name, presence: true
  validates :duration, presence: true
  validates :price, presence: true
  
end
