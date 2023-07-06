# == Schema Information
#
# Table name: restaurants
#
#  id          :bigint           not null, primary key
#  address     :string
#  city        :string
#  description :text
#  name        :string
#  photo_url   :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class RestaurantSerializer
  include JSONAPI::Serializer
  attributes :name, :description, :address, :city, :photo_url
end
