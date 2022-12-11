class Resident < ApplicationRecord
  validates_presence_of :name, 
                        :age,
                        :occupation

  has_many :resident_courses
  has_many :courses, through: :resident_courses

  def self.average_age
    Resident.all.average(:age)
  end 
end
