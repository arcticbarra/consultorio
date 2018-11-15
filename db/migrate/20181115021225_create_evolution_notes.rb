class CreateEvolutionNotes < ActiveRecord::Migration[5.1]
  def change
    create_table :evolution_notes do |t|
      t.belongs_to :doctor, foreign_key: true
      t.belongs_to :patient, foreign_key: true
      t.text :diagnosis
      t.text :treatment

      t.timestamps
    end
  end
end
