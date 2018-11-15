class CreateDoctors < ActiveRecord::Migration[5.1]
  def change
    create_table :doctors do |t|
      t.belongs_to :user, foreign_key: true
      t.string :first_name, null: false
      t.string :last_name_father, null: false
      t.string :last_name_mother, null: false
      t.string :cedula, null: false

      t.timestamps
    end
  end
end
