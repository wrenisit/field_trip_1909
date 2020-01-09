require 'rails_helper'

RSpec.describe "Airline Index Spec" do
  describe "When I visit the airline index page" do
    it 'I can see all airline names listed as links to their show page' do
      southwest = Airline.create(name: "Southwest")
      american = Airline.create(name: "American")

      visit '/airlines'

      within "#airline-#{southwest.id}" do
        expect(page).to have_link(southwest.name)
      end

      within "#airline-#{american.id}" do
        expect(page).to have_link(american.name)
        click_link american.name
      end

      expect(current_path).to eq("/airlines/#{american.id}")
    end
  end
end
