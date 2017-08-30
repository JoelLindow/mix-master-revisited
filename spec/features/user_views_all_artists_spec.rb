require 'rails_helper'

RSpec.feature "User visits artist index" do
  scenario "they can see all artists" do
    # As a user
    # Given that artists exist in the database
    artist_1 = Artist.create(name:"Lionel Richie", image_path: "https://upload.wikimedia.org/wikipedia/en/9/9e/Lionel_Richie_Hello.jpg")
    artist_2 = Artist.create(name:"Rionel Lichie", image_path: "https://upload.wikimedia.org/wikipedia/en/9/9e/Lionel_Richie_Hello.jpg")

    # When I visit the artists index

    visit artists_path

    # Then I should see each artist's name

    expect(page).to have_content("Lionel Richie")
    expect(page).to have_content("Rionel Lichie")

    # And each name should link to that artist's individual page

    click_link "Lionel Richie"
    expect(page).to have_content("Lionel Richie")
    expect(page).to_not have_content("Rionel Lichie")
  end
end
