class Membership < ApplicationRecord
  belongs_to :member
  belongs_to :membership_type
end
