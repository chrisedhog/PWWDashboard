class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :first_name, :required => true
      t.string :last_name
      t.string :company_name
      t.string :country
      t.string :city
      t.integer :direct_number
      t.string :position
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
