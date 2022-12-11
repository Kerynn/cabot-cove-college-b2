require 'rails_helper'

RSpec.describe Course, type: :model do

  describe 'validations' do
    it {should validate_presence_of :name}
  end

  describe 'relationships' do
    it {should have_many :resident_courses}
    it {should have_many(:residents).through(:resident_courses)}
  end

  describe 'num_enrolled' do 
    it 'counts the number of residents enrolled in the course' do 
      jessica = Resident.create!(name: "Jessica Fletcher", age: 65, occupation: "Mystery writer")
      seth = Resident.create!(name: "Dr. Seth Hazlitt", age: 70, occupation: "Town Doctor")
      sara = Resident.create!(name: "Sara", age: 43, occupation: "retired")
      charles = Resident.create!(name: "Charlie Boy", age: 90, occupation: "Counselor")
      mike = Resident.create!(name: "Mikey Day", age: 96, occupation: "Engineer")
      joe = Resident.create!(name: "Joe Johnson", age: 82, occupation: "Architect")
      crime = Course.create!(name: "Crime Scenes 101")
      fingerprinting = Course.create!(name: "Fingerprinting")
      ResidentCourse.create!(course: crime, resident: jessica)
      ResidentCourse.create!(course: fingerprinting, resident: jessica)
      ResidentCourse.create!(course: crime, resident: seth)
      ResidentCourse.create!(course: fingerprinting, resident: charles)
      ResidentCourse.create!(course: crime, resident: sara)
      ResidentCourse.create!(course: fingerprinting, resident: joe)
      ResidentCourse.create!(course: crime, resident: mike)

      expect(crime.num_enrolled).to eq(4)
      expect(fingerprinting.num_enrolled).to eq(3)
    end 
  end
end
