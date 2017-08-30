require 'rails_helper'

RSpec.feature "User visits edit page for artist" do
  scenario "they edit an artist" do
    # As a user
    # Given that an artist exists in the database
    artist_1 = Artist.create(name:"Lionel Richie", image_path: "https://upload.wikimedia.org/wikipedia/en/9/9e/Lionel_Richie_Hello.jpg")

    # When I visit that artist's show page
    visit artist_path(artist_1)

    # And I click on "Edit"
    click_link "Edit"

    # And I fill in a new name
    fill_in "artist_name", with: "Snobbles McGoggles"

    # And I click on "Update Artist"
    click_on "Update Artist"

    # Then I should see the artist's updated name
    expect(page).to have_content("Snobbles McGoggles")

    # Then I should see the existing image
    # I DON"T KNOW HOW TO TEST THIS!
  end
end
