class City < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :city_name, :uniqueness => true

  validates :city_name, :presence => true

end
