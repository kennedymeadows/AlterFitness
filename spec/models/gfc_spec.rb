require 'rails_helper'

RSpec.describe 'Creating a Gfc', type: :system do
  before do
    login_as(create(:user))
    visit new_gfc_path
  end

  scenario 'valid inputs' do
    fill_in 'Title', with: "T.E.A.M."
    fill_in 'Body', with: "T.E.A.M is a Strength and Conditioning format where we challenge you with the best of HIIT.  We stack Tabata rounds of intense agility, and core work, on top of Upper Body, and Lower Body Strength sets using EMOM (every minute on the minute)  and AMRAP (as many rounds as possible!)  rounds to give you a full-body, high-energy burn for some of the most challenging Metcon in LA. Come get Altered with your Tabata, EMOM, AMRAP, Metcon. "
    click_on 'Create Gfc'

  expect(page).to have_content('Gfc')
  end
end
