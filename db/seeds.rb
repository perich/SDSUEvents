# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Social = Category.create(name: "Social")
Sports = Category.create(name: "Sports")
Greek = Category.create(name: "Greek")
Professional = Category.create(name: "Professional")
Concert = Category.create(name: "Concert")
Other = Category.create(name: "Other")

user = User.create(email: "bob@example.com", password: "football4life", name: "Bob Green")

30.times do
	Event.create(body: "Hello World!", user_id: 1, category_id: rand(1..6))
end
