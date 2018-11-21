module PatientsHelper
  def to_literal(val)
    if val
      'Sí'
    else
      'No'
    end
  end
end
