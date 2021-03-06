require 'rails_helper'

RSpec.describe "test_student_index_page", type: :feature do
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

  it "shows a list of courses and professors a student has" do

    visit "/students"

    expect(page).to have_content("#{@harry.name}")
    expect(page).to have_content("#{@malfoy.name}")
    expect(page).to have_content("#{@longbottom.name}")

    expect(page).to have_content("#{@harry.professor_count}")
    expect(page).to have_content("#{@malfoy.professor_count}")
    expect(page).to have_content("#{@longbottom.professor_count}")
  end
end
