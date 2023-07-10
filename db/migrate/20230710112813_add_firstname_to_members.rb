class AddFirstnameToMembers < ActiveRecord::Migration[7.0]
  def change
    add_column :members, :firstname, :string
  end
end
