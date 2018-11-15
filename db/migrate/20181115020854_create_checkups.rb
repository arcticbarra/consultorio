class CreateCheckups < ActiveRecord::Migration[5.1]
  def change
    create_table :checkups do |t|
      t.text :family_comments
      t.text :personal_comments
      t.text :allergies
      t.text :surgeries
      t.text :results

      t.timestamps
    end
  end
end
