class AddMissingElementsToCheckup < ActiveRecord::Migration[5.1]
  def change
    add_column :checkups, :family_cancer, :boolean
    add_column :checkups, :family_diabetes, :boolean
    add_column :checkups, :family_hipertension, :boolean
    add_column :checkups, :personal_cancer, :boolean
    add_column :checkups, :personal_diabetes, :boolean
    add_column :checkups, :personal_hipertension, :boolean
  end
end
