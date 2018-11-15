class CreatePatientDiseases < ActiveRecord::Migration[5.1]
  def change
    create_table :patient_diseases do |t|
      t.belongs_to :patient, foreign_key: true
      t.belongs_to :disease, foreign_key: true
      t.boolean :family, default: false, null: false

      t.timestamps
    end
  end
end
