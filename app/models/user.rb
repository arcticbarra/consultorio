class User < ApplicationRecord
  has_one :patient
  has_one :doctor
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  accepts_nested_attributes_for :patient, :doctor
end
