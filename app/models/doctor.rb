class Doctor < ApplicationRecord
  belongs_to :user
  has_many :evolution_notes
end
