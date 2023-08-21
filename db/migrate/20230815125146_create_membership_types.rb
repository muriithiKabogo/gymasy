class CreateMembershipTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :membership_types do |t|
      t.string :membership_name
      t.integer :duration
      t.integer :price
      t.references :gym, null: false, foreign_key: true
      t.references :admin, null: false, foreign_key: true

      t.timestamps
    end
  end
end
