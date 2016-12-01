class City < ApplicationRecord
  # Direct associations

  belongs_to :user,
             :counter_cache => true

  # Indirect associations

  # Validations

  validates :city_name, :uniqueness => true

  validates :city_name, :presence => true

end
