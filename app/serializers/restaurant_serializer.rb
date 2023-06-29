class RestaurantSerializer
  include JSONAPI::Serializer
  attributes :name, :description, :address, :city, :photo_url
end
