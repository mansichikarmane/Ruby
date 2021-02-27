require "date"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Cat.create(Date.new(2002, 03, 02), 'black', 'Joe', 'M')
Cat.create({birth_date: Date.new(2001, 12, 01), color: 'gray', name: 'Joella', sex: 'F'})