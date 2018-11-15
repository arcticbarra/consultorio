class Patient < ApplicationRecord
  belongs_to :user
  has_many :diseases, through: :patient_diseases
  enum gender: %i[male female]
  enum civil_status: %i[single married free_union divorced widowed]
  enum occupation: %i[student employee merchant retired housewife]
  enum heard_about_us: %i[facebook doctoralia website recommendation other]

  def family_antecedents
    diseases.where(family: true)
  end

  def patient_antecedents
    diseases.where(family: false)
  end
end
