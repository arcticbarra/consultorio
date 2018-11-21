class AddCheckupToPatient < ActiveRecord::Migration[5.1]
  def change
    add_reference :patients, :checkup, foreign_key: true
  end
end
