# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(name: "admin", password: "asdfasdf", password_confirmation: "asdfasdf") if User.find_by(name: "admin").blank?
User.create(name: "cathy", password: "cathy", password_confirmation: "cathy") if User.find_by(name: "cathy").blank?
