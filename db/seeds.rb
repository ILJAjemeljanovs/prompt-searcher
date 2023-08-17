# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "csv"

filepath = "#{Rails.root}/db/seeds.csv"
total = File.open(filepath).count
i=1

CSV.foreach(filepath) do |prompt|
  Prompt.create!(text: prompt.first)
  puts "Processed #{i} of #{total}."
  i += 1
end
Prompt.__elasticsearch__.create_index!
Prompt.import
