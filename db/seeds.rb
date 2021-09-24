# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Appointment.destroy_all
House.destroy_all

8.times do
    house = House.create(name: Faker::Movies::HarryPotter.unique.house,
     points: Faker::Number.number(digits: 2))

     students_per_house = Faker::Number.number(digits: 2).to_i
     puts "Adding #{students_per_house} students to house #{house.name}."
     students_per_house.times do 
        house.students.create(name: Faker::Name.unique.name)

     end

     Teacher.create(name: Faker::Name.unique.name, house: house)
end

10.times do
   student = Student.all.sample
   teacher = Teacher.all.sample
   date  = Faker::Time.forward(days: 8, period: :morning)
   Appointment.create(student: student, teacher: teacher, meeting_time: date)

end

puts "Seeding Complete"
puts "there are #{House.count} houses."
puts "there are #{Student.count} students."
puts "there are #{Teacher.count} teachers."
puts "there are #{Appointment.count} appointments."