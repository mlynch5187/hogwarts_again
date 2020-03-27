# User Story 2 of 4
# As a visitor,
# When I visit '/professors/:id'
# I see a list of the names of the students the professors have.
# (e.g. "Neville Longbottom"
#       "Hermione Granger"
#       "Luna Lovegood")

require 'rails_helper'

RSpec.describe "test professor show page", type: :feature do
  it "shows names of all students a professor has" do

    meg_stang = Professor.create!(name: "Meg Stang",
                                  age: "32",
                                  specialty: "Keepin' It Real")

    mike_dao = Professor.create!(name: "Mike Dao",
                                  age: "40",
                                  specialty: "Bangin' House Parties")

    tyler_tomlinson = Student.create!(name: "Tyler Tomlinson",
                                  age: "31",
                                  house: "Wise Guys",
                                  professor: mike_dao)

    visit "/professors/#{mike_dao.id}"

    expect(page).to have_content(tyler_tomlinson.name)
  end
end
