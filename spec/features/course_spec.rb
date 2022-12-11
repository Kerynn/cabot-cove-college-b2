require 'rails_helper'

RSpec.describe Course do 
  describe 'when I visit /courses' do 
    it 'shows a list of courses and the number of residents enrolled' do 
      jessica = Resident.create!(name: "Jessica Fletcher", age: 65, occupation: "Mystery writer")
      seth = Resident.create!(name: "Dr. Seth Hazlitt", age: 70, occupation: "Town Doctor")
      sara = Resident.create!(name: "Sara", age: 43, occupation: "retired")
      charles = Resident.create!(name: "Charlie Boy", age: 90, occupation: "Counselor")
      mike = Resident.create!(name: "Mikey Day", age: 96, occupation: "Engineer")
      joe = Resident.create!(name: "Joe Johnson", age: 82, occupation: "Architect")
      jim = Resident.create!(name: "Jimmy", age: 79, occupation: "Receptionist")
      lady = Resident.create!(name: "Lady Lew", age: 82, occupation: "Dog Trainer")
      kamee = Resident.create!(name: "Precious Kamee", age: 99, occupation: "The Greatest")
      ozzie = Resident.create!(name: "Ozzie Paws", age: 103, occupation: "Sheriff")

      crime = Course.create!(name: "Crime Scenes 101")
      fingerprinting = Course.create!(name: "Fingerprinting")

      ResidentCourse.create!(course: crime, resident: jessica)
      ResidentCourse.create!(course: crime, resident: seth)
      ResidentCourse.create!(course: crime, resident: sara)
      ResidentCourse.create!(course: crime, resident: mike)
      ResidentCourse.create!(course: crime, resident: lady)
      ResidentCourse.create!(course: fingerprinting, resident: jessica)
      ResidentCourse.create!(course: fingerprinting, resident: seth)
      ResidentCourse.create!(course: fingerprinting, resident: sara)
      ResidentCourse.create!(course: fingerprinting, resident: charles)
      ResidentCourse.create!(course: fingerprinting, resident: mike)
      ResidentCourse.create!(course: fingerprinting, resident: joe)
      ResidentCourse.create!(course: fingerprinting, resident: jim)
      ResidentCourse.create!(course: fingerprinting, resident: lady)
      ResidentCourse.create!(course: fingerprinting, resident: kamee)
      ResidentCourse.create!(course: fingerprinting, resident: ozzie)

      visit "/courses"

      expect(page).to have_content("#{crime.name}: #{crime.num_enrolled}")
      expect(page).to have_content("#{fingerprinting.name}: #{fingerprinting.num_enrolled}")
    end 
  end 
end 