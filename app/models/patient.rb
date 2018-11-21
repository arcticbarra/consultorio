class Patient < ApplicationRecord
  belongs_to :user
  has_many :diseases, through: :patient_diseases
  has_many :evolution_notes
  has_many :appointments
  belongs_to :checkup, optional: true
  enum gender: %i[Masculino Femenino]
  enum civil_status: ['Soltero', 'Casado', 'Union Libre', 'Divorciado', 'Viudo']
  enum occupation: ['Estudiante', 'Empleado', 'Comerciante', 'Jubilado', 'Ama de casa']
  enum heard_about_us: ['Facebook', 'Doctoralia', 'Sitio Web', 'Recomendación', 'Otro']

  def family_antecedents
    diseases.where(family: true)
  end

  def patient_antecedents
    diseases.where(family: false)
  end
end
