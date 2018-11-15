class CreateAppointments < ActiveRecord::Migration[5.1]
  def change
    create_table :appointments do |t|
      t.belongs_to :doctor, foreign_key: true
      t.belongs_to :patient, foreign_key: true
      t.string :reason_of_consult
      t.date :appointment_date
      t.integer :appointment_type

      t.timestamps
    end
  end
end
