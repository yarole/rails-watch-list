# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'net/http'
require 'json'

puts "Refreshing movie list..."
Movie.destroy_all

url = 'https://tmdb.lewagon.com/movie/top_rated'
uri = URI(url)
response = Net::HTTP.get(uri)
data = JSON.parse(response)['results']

data.each do |item|
  Movie.create(
    title: item["original_title"],
    overview: item["overview"],
    poster_url: "https://image.tmdb.org/t/p/w500#{item["poster_path"]}",
    rating: item["vote_average"]
  )
end
