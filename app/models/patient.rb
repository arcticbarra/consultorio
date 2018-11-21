class Patient < ApplicationRecord
  belongs_to :user
  has_many :diseases, through: :patient_diseases
  enum gender: %i[Masculino Femenino]
  enum civil_status: ['Soltero', 'Casado', 'Union Libre', 'Divorciado', 'Viudo']
  enum occupation: ['Estudiante', 'Empleado', 'Comerciante', 'Jubilado', 'Ama de casa']
  enum heard_about_us: %i[facebook doctoralia website recommendation other]

  def family_antecedents
    diseases.where(family: true)
  end

  def patient_antecedents
    diseases.where(family: false)
  end
end
