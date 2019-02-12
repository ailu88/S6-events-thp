
puts "WELCOME TO SEED\n\n"
puts "DESTROYING DB\n"

puts "Destroying users"
User.destroy_all
puts "Users destroyed\n"

puts "Destroying events"
Event.destroy_all
puts "Events destroyed\n"

puts "Destroying attendances"
Attendance.destroy_all
puts "Attendances destroyed\n"




puts "\n\n"
puts "SEEDING NEW DB\n"

puts "Seeding users"
5.times do 
	User.create(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        email: Faker::Internet.email,
        description: Faker::Lorem.paragraph(14)
  )
end
puts "users seeded\n"


puts "Seeding events"
3.times do
  Event.create(
    start_date: Faker::Date.forward(400),
    duration: 5*rand(1..20),
    title: Faker::Lorem.paragraph(3),
    description: Faker::Lorem.paragraph(10),
    admin: User.all.sample,
    price: rand(1..1000),
    location: Faker::HarryPotter.location
  )
end
puts "events seeded\n"


puts "Seeding attendances"
10.times do 
  Attendance.create(
    event: Event.all.sample,
    attendant: User.all.sample,
    stripe_customer_id: Faker::HarryPotter.spell    
  )
end
puts "Attendances seeded\n"


puts "\nEND OF SEED"
puts "SEE YOU SOON 👋"