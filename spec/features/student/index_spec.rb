require 'rails_helper'

RSpec.describe "test student index page", type: :feature do
  it "shows all student names, ages, specialties on index page" do
    mike_dao = Professor.create!(name: "Mike Dao",
                                  age: "40",
                                  specialty: "Bangin' House Parties")

    meg_stang = Professor.create!(name: "Meg Stang",
                                  age: "32",
                                  specialty: "Keepin' It Real")

    tyler_tomlinson = Student.create!(name: "Tyler Tomlinson",
                                  age: "31",
                                  house: "Wise Guys",
                                  professor: mike_dao)

    visit "/students"

    expect(page).to have_content("1")
    expect(page).to have_content("History")
    expect(page).to have_content("French")
  end
end

# User Story 3 of 4
# As a visitor,
# When I visit '/students'
# I see a list of courses and the number of professors each student has.
# (e.g. "Draco Malfoy: 5"
#       "Nymphadora Tonks: 10")
