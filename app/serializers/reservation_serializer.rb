class ReservationSerializer
  include JSONAPI::Serializer
  attributes :group_size, :booking_date
  belongs_to :user
  belongs_to :table
end
