class AddAdminToGyms < ActiveRecord::Migration[7.0]
  def change
    add_reference :gyms, :admin, null: false, foreign_key: true
  end
end
