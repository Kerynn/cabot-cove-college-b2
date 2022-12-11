require 'rails_helper'

RSpec.describe Resident, type: :model do

  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
    it {should validate_presence_of :occupation}
  end

  describe 'relationships' do
    it {should have_many :resident_courses}
    it {should have_many(:courses).through(:resident_courses)}
  end

  describe 'average_age' do 
    it 'calculates the average age of all the residents' do 
      jessica = Resident.create!(name: "Jessica Fletcher", age: 65, occupation: "Mystery writer")
      seth = Resident.create!(name: "Dr. Seth Hazlitt", age: 70, occupation: "Town Doctor")
      charles = Resident.create!(name: "Charlie Boy", age: 90, occupation: "Counselor")
      joe = Resident.create!(name: "Joe Johnson", age: 82, occupation: "Architect")
      jim = Resident.create!(name: "Jimmy", age: 79, occupation: "Receptionist")
      kamee = Resident.create!(name: "Precious Kamee", age: 99, occupation: "The Greatest")
      ozzie = Resident.create!(name: "Ozzie Paws", age: 103, occupation: "Sheriff")

      residents = Resident.all
      expect(residents.average_age).to eq(84)
    end
  end 
end
