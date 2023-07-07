# == Schema Information
#
# Table name: tables
#
#  id            :bigint           not null, primary key
#  number        :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  restaurant_id :bigint           not null
#
# Indexes
#
#  index_tables_on_restaurant_id  (restaurant_id)
#
# Foreign Keys
#
#  fk_rails_...  (restaurant_id => restaurants.id)
#
class Table < ApplicationRecord
  belongs_to :restaurant, dependent: :destroy
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
