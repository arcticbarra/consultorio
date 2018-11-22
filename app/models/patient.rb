class Patient < ApplicationRecord
  belongs_to :user
  has_many :patient_diseases
  has_many :diseases, through: :patient_diseases
  has_many :evolution_notes
  has_many :appointments
  has_one :checkup
  enum gender: %i[Masculino Femenino]
  enum civil_status: ['Soltero', 'Casado', 'Union Libre', 'Divorciado', 'Viudo']
  enum occupation: ['Estudiante', 'Empleado', 'Comerciante', 'Jubilado', 'Ama de casa']
  enum heard_about_us: ['Facebook', 'Doctoralia', 'Sitio Web', 'Recomendación', 'Otro']

  accepts_nested_attributes_for :checkup

  def family_antecedents
    patient_diseases.where(family: true).map(&:disease)
  end

  def patient_antecedents
    patient_diseases.where(family: false).map(&:disease)
  end

  def show_attributes
    {
      'Nombre' => "#{first_name} #{last_name_father} #{last_name_mother}",
      'Correo' => user.email,
      'Sexo' => gender,
      'Fecha de nacimiento' => birth_date,
      'Estado civil' => civil_status,
      'Ocupación' => occupation,
      'Teléfono' => phone,
      'Calle' => street,
      'Colonia' => colony,
      'Código Postal' =>  zip_code,
      'Ciudad' => city,
      'Estado' => state,
      'RFC' => rfc || 'N.D.',
    }
  end
end
