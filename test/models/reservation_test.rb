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
require "test_helper"

class ReservationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
