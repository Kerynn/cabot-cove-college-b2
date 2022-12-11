require 'rails_helper'

RSpec.describe Resident do 
  describe 'when I visit /residents' do 
    it 'shows the list of residents with their attributes' do 
      jessica = Resident.create!(name: "Jessica Fletcher", age: 65, occupation: "Mystery writer")
      seth = Resident.create!(name: "Dr. Seth Hazlitt", age: 70, occupation: "Town Doctor")

      visit "/residents"

      expect(page).to have_content(jessica.name)
      expect(page).to have_content(jessica.age)
      expect(page).to have_content(jessica.occupation)
      expect(page).to have_content(seth.name)
      expect(page).to have_content(seth.age)
      expect(page).to have_content(seth.occupation)
    end

    it 'shows the average age of all residents' do 
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

      visit "/residents"

      expect(page).to have_content("Average Age: 80.9")
    end 
  end 

  describe 'when I visit /residents/:id' do
    it 'shows the resident name and a list of their courses' do 
      jessica = Resident.create!(name: "Jessica Fletcher", age: 65, occupation: "Mystery writer")
      crime = Course.create!(name: "Crime Scenes 101")
      fingerprinting = Course.create!(name: "Fingerprinting")
      ResidentCourse.create!(course: crime, resident: jessica)
      ResidentCourse.create!(course: fingerprinting, resident: jessica)

      visit "residents/#{jessica.id}"

      expect(page).to have_content(jessica.name)
      expect(page).to have_content(crime.name)
      expect(page).to have_content(fingerprinting.name)
    end 
  end 
end 