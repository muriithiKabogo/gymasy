class AddAdminToMembers < ActiveRecord::Migration[7.0]
  def change
    add_reference :members, :admin, null: false, foreign_key: true
  end
end
