class CreatePatients < ActiveRecord::Migration[5.1]
  def change
    create_table :patients do |t|
      t.belongs_to :user, foreign_key: true
      t.string :first_name, null: false
      t.string :last_name_father, null: false
      t.string :last_name_mother, null: false
      t.integer :gender, null: false
      t.date :birth_date, null: false
      t.integer :civil_status, null: false
      t.integer :occupation, null: false
      t.string :phone, null: false
      t.string :street, null: false
      t.string :colony, null: false
      t.string :zip_code, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.string :rfc

      t.timestamps
    end
  end
end
