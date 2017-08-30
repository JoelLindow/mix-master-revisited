require 'rails_helper'

RSpec.feature "User visits artist page" do
  scenario "they delete that artist" do
    # As a user
    # Given that an artist exists in the database
    artist_1 = Artist.create(name:"Lionel Richie", image_path: "https://upload.wikimedia.org/wikipedia/en/9/9e/Lionel_Richie_Hello.jpg")
    artist_2 = Artist.create(name:"Marty Robbins", image_path: "https://upload.wikimedia.org/wikipedia/en/9/9e/Lionel_Richie_Hello.jpg")

    # When I visit that artist's show page
    visit artist_path(artist_1)

    # And I click on "Delete"
    click_on "Delete"

    # Then I should be back on the artist index page
    # Then I should not see the artist's name

    expect(page).to_not have_content("Lionel Richie")
    expect(page).to have_content("Marty Robbins")
  end
end
