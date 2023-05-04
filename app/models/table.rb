class Table < ApplicationRecord
  belongs_to :restaurant
  has_many :reservations


  validate :validate_max_tables_per_restaurant

  private

  def validate_max_tables_per_restaurant
    if restaurant.tables.count >= 15
      # errors.add(:base, "No se pueden crear más de 15 mesas por restaurante")
      errors.add(:restaurant, 'No se pueden crear más de 15 mesas por restaurante')
    end
  end
end
