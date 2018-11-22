class MakeChangesToCheckup < ActiveRecord::Migration[5.1]
  def change
    add_reference :checkups, :patient, index: true
    add_foreign_key :checkups, :patients
  end
end
