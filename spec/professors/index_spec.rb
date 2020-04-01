require 'rails_helper'

RSpec.describe "test index page", type: :feature do
  before(:each) do

    @snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
    @hagarid = Professor.create(name: "Rubus Hagarid", age: 38 , specialty: "Care of Magical Creatures")
    @lupin = Professor.create(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")

    @harry = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
    @malfoy = Student.create(name: "Draco Malfoy" , age: 12 , house: "Slytherin" )
    @longbottom = Student.create(name: "Neville Longbottom" , age: 11 , house: "Gryffindor" )

    ProfessorStudent.create(student_id: @harry.id, professor_id: @snape.id)
    ProfessorStudent.create(student_id: @harry.id, professor_id: @hagarid.id)
    ProfessorStudent.create(student_id: @harry.id, professor_id: @lupin.id)
    ProfessorStudent.create(student_id: @malfoy.id, professor_id: @hagarid.id)
    ProfessorStudent.create(student_id: @malfoy.id, professor_id: @lupin.id)
    ProfessorStudent.create(student_id: @longbottom.id, professor_id: @snape.id)
  end

  it "shows a list of professors with attributes" do

    visit "/professors"

    expect(page).to have_content("#{@snape.name}")
    expect(page).to have_content("#{@snape.age}")
    expect(page).to have_content("#{@snape.specialty}")

    expect(page).to have_content("#{@hagarid.name}")
    expect(page).to have_content("#{@hagarid.age}")
    expect(page).to have_content("#{@hagarid.specialty}")

    expect(page).to have_content("#{@lupin.name}")
    expect(page).to have_content("#{@lupin.age}")
    expect(page).to have_content("#{@lupin.specialty}")
  end
end
# User Story 1 of 4
# As a visitor,
# When I visit '/professors',
# I see a list of professors with the following information:
# -Name
# -Age
# -Specialty
# (e.g. "Name: Minerva McGonagall, Age: 204, Specialty: Transfiguration")
# ```
