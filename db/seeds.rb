
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
user1 = User.create! :first_name => 'Berenice', :last_name => 'de Nice', :email => 'berenice@yopmail.com', :password => 'azerty', :password_confirmation => 'azerty'
user2 = User.create! :first_name => 'Mathieu', :last_name => 'the Best', :email => 'mathieu@yopmail.com', :password => 'azerty', :password_confirmation => 'azerty'
user = User.create! :first_name => 'Polo', :last_name => 'Pogba', :email => 'polo@yopmail.com', :password => 'azerty', :password_confirmation => 'azerty'
puts "Users seeded"

puts "Seeding events"
8.times do
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
18.times do 
  Attendance.create(
    event: Event.all.sample,
    attendant: User.all.sample,
    stripe_customer_id: Faker::HarryPotter.spell    
  )
end
puts "Attendances seeded\n"


puts "\nEND OF SEED"
puts "SEE YOU SOON 👋"