class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         belongs_to :admin
         has_many :checkins

  def self.ransackable_attributes(auth_object = nil)
    [ "firstname"]
  end
end
