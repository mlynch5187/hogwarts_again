require 'rails_helper'

RSpec.describe "test professor index page", type: :feature do
  it "shows all professor names, ages, specialties on index page" do
    mike_dao = Professor.create!(name: "Mike Dao",
                                  age: "40",
                                  specialty: "Bangin' House Parties")

    meg_stang = Professor.create!(name: "Meg Stang",
                                  age: "32",
                                  specialty: "Keepin' It Real")

    visit "/professors"

    expect(page).to have_content(mike_dao.name)
    expect(page).to have_content(meg_stang.name)
  end
end
