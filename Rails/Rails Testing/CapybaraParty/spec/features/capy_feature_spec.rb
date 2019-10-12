require 'rails_helper'

feature "capybara features", type: :feature do
  feature "making a new capybara" do

    scenario "with invalid params" do
      sign_up_capy("anya", nil)

      expect(current_path).to eq("/capys")
      expect(page).to have_content("Color can't be blank")
    end

    scenario "with valid params" do
      sign_up_capy("anya", "yellow")

      expect(page).to have_content("anya")
      expect(current_path).to eq("/capys/#{Capy.find_by(name: 'anya').id}")
    end
  end
end
