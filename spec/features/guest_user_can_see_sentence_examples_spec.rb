require 'rails_helper'

describe 'guest user can see sentence examples' do
  describe 'on the root page' do
    it 'allows a user to submit a word and see sentence examples for that word' do

      visit '/'
      fill_in :word, with: "mindfulness"
      click_on "Submit"

      expect(page).to have_content("Examples for using 'mindfulness'")
      expect(page).to have_content("Meditation is one way to express mindfulness in a dedicated, concentrated manner.")
      expect(page).to have_content("At such times, mindfulness of the practice of patience and the application of certain techniques will help us to continue generating this attitude.")
    end
  end
end
