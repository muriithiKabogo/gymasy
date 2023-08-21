class DropMembershipTypes < ActiveRecord::Migration[7.0]
  def change
     drop_table :membership_types
  end
end
