require 'rails_helper'

describe 'guest user can see sentence examples' do
  describe 'on the root page' do
    it 'allows a user to submit a word and see sentence examples for that word' do

      visit '/'
      fill_in :word, with: "mindfulness"
      click_on "Submit"

      expect(page).to have_content("Examples for using 'mindfulness'")
    end
  end
end




# Uses: Sentences section on this page https://developer.oxforddictionaries.com/documentation
#
# ```As a guest user (no sign in required)
# When I visit "/"
# And I fill in a text box with "mindfulness"
# And I click "Submit"
# Then I should see a message that says "Examples for using 'mindfulness'"
# And I should see a list of sentences with examples of how to use the word
# And I should see only sentences where the region for usage is "Brittish" or "Canadian"
# And I should not see sentences for any other regions (or blank regions)```
