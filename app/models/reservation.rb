# == Schema Information
#
# Table name: reservations
#
#  id           :bigint           not null, primary key
#  booking_date :datetime
#  group_size   :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  table_id     :bigint           not null
#  user_id      :bigint
#
# Indexes
#
#  index_reservations_on_table_id  (table_id)
#  index_reservations_on_user_id   (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (table_id => tables.id)
#  fk_rails_...  (user_id => users.id)
#
class Reservation < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :table

  # validate :validate_max_reservations_per_restaurant_per_day
  validate :validate_max_reservations


  # def validate_max_reservations_per_restaurant_per_day(fecha)
  #   resultado = Reservation.where(booking_date: fecha).select {|reserva| reserva.table.restaurant_id==8}.count
  #     # errors.add(:base, "No se pueden crear más de 15 reservas para el restaurante xxx en el día seleccionado.")
  # end

  def validate_max_reservations
    if Reservation.count >= 20
      errors.add(:base, "No se pueden crear más de 20 reservaciones entre todos los restaurantes")
    end
  end
end
