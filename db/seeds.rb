# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


Reservation.destroy_all
Table.destroy_all
User.destroy_all
Restaurant.destroy_all

restaurant_1 = Restaurant.new(name: "El bar de Andres", description: "Las mejores colas de mono y Piscos de todo copiapó", address: "Calle de la Luna 13", city: "Copiapó", photo_url: "https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80")
restaurant_1.save!
restaurant_2 = Restaurant.new(name: "el tragadero", description: "las mejores butifarras", address: "calle 50", city: "medellín", photo_url: "https://images.unsplash.com/photo-1590846406792-0adc7f938f1d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=385&q=80")
restaurant_2.save!
puts "Restaurante creado"

user_1 = User.new(name: "Diego Marín Montoya", username: "Dieguchi", email: "elbrayan@hotmail.com", password: "123456")
user_1.save!
user_2 = User.new(name: "Carlota Alarcón Gate", username: "Carluchi", email: "carlota@hotmail.com", password: "123456")
user_2.save!
puts "Usuario creado"

table_1 = Table.new(number: "1", restaurant_id: restaurant_1.id)
table_1.save!
table_2 = Table.new(number: "2", restaurant_id: restaurant_2.id)
table_2.save!

puts "Mesa creada"

reservation_1 = Reservation.new(group_size: 4, booking_date: "2023/4/5", user_id: user_1.id, table_id: table_1.id)
reservation_1.save!

reservation_2 = Reservation.new(group_size: 4, booking_date: "2023/4/5", user_id: user_2.id, table_id: table_2.id)
reservation_2.save!
puts "Reservación creada"

# to do queries and know how many reservations are in a specific date
# resultado = Reservation.where(booking_date: "2023/5/28").select { |reserva| reserva.table.restaurant_id == params[:restaurant_id] }.count
