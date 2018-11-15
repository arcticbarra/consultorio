class AddHeardToPatient < ActiveRecord::Migration[5.1]
  def change
    add_column :patients, :heard_about_us, :integer
  end
end
