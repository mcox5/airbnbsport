# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# Esto es un comentario de prueba branch
puts "Cleaning Sports..."
Booking.destroy_all
Product.destroy_all
Sport.destroy_all
sports = ["Tenis", "Futbol", "Trekking", "Basquetball"]
puts "Creating Sports"
sports.each do |sport|
  Sport.create(name: sport)
end
puts "Sport created!"
