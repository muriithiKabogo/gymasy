class CreateCheckins < ActiveRecord::Migration[7.0]
  def change
    create_table :checkins do |t|
      t.references :member, null: false, foreign_key: true
      t.string :paymentMode
      t.boolean :paid
      t.integer :amount

      t.timestamps
    end
  end
end
