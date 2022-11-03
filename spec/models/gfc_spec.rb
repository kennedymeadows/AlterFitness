require 'rails_helper'

RSpec.describe 'Creating a Gfc', type: :system do
  before do
    login_as(create(:user))
  end

  scenario 'valid inputs' do
    visit new_gfc_path
    fill_in 'gfc_title', with: "T.E.A.M."
    find(".trix-content").set("T.E.A.M is a Strength and Conditioning format where we challenge you with the best of HIIT.  We stack Tabata rounds of intense agility, and core work, on top of Upper Body, and Lower Body Strength sets using EMOM (every minute on the minute)  and AMRAP (as many rounds as possible!)  rounds to give you a full-body, high-energy burn for some of the most challenging Metcon in LA. Come get Altered with your Tabata, EMOM, AMRAP, Metcon.")
    click_on 'Create Gfc'
    expect(page).to have_content('T.E.A.M.')
  end
end

RSpec.describe 'Creating a Gfc', type: :system do
  before do
    login_as(create(:user))
  end

  scenario 'Invalid title' do
    visit new_gfc_path
    find(".trix-content").set("T.E.A.M is a Strength and Conditioning format where we challenge you with the best of HIIT.  We stack Tabata rounds of intense agility, and core work, on top of Upper Body, and Lower Body Strength sets using EMOM (every minute on the minute)  and AMRAP (as many rounds as possible!)  rounds to give you a full-body, high-energy burn for some of the most challenging Metcon in LA. Come get Altered with your Tabata, EMOM, AMRAP, Metcon.")
    click_on 'Create Gfc'
  expect(page).to have_content('Title can\'t be blank')
  end
end

RSpec.describe 'Creating a Gfc', type: :system do
  before do
    login_as(create(:user))
  end

  scenario 'Invalid body' do
    visit new_gfc_path
    fill_in 'gfc_title', with: "T.E.A.M."
    click_on 'Create Gfc'
  expect(page).to have_content('Body can\'t be blank')
  end
end

RSpec.describe 'Viewing a Gfc', type: :system do
  before do
    login_as(create(:user))
    visit new_gfc_path
    fill_in 'gfc_title', with: "T.E.A.M."
    find(".trix-content").set("T.E.A.M is a Strength and Conditioning format where we challenge you with the best of HIIT.  We stack Tabata rounds of intense agility, and core work, on top of Upper Body, and Lower Body Strength sets using EMOM (every minute on the minute)  and AMRAP (as many rounds as possible!)  rounds to give you a full-body, high-energy burn for some of the most challenging Metcon in LA. Come get Altered with your Tabata, EMOM, AMRAP, Metcon.")
    click_on 'Create Gfc'
  end

  scenario 'View class title' do
    visit gfcs_path
    click_on "T.E.A.M."
    expect(page).to have_content("T.E.A.M.")
  end
end

RSpec.describe 'Viewing a Gfc', type: :system do
  before do
    login_as(create(:user))
    visit new_gfc_path
    fill_in 'gfc_title', with: "T.E.A.M."
    find(".trix-content").set("T.E.A.M is a Strength and Conditioning format where we challenge you with the best of HIIT.  We stack Tabata rounds of intense agility, and core work, on top of Upper Body, and Lower Body Strength sets using EMOM (every minute on the minute)  and AMRAP (as many rounds as possible!)  rounds to give you a full-body, high-energy burn for some of the most challenging Metcon in LA. Come get Altered with your Tabata, EMOM, AMRAP, Metcon.")
    click_on 'Create Gfc'
  end

  scenario 'View class body' do
    visit gfcs_path
    click_on "T.E.A.M."
    expect(page).to have_content("T.E.A.M is a Strength and Conditioning format where we challenge you with the best of HIIT.  We stack Tabata rounds of intense agility, and core work, on top of Upper Body, and Lower Body Strength sets using EMOM (every minute on the minute)  and AMRAP (as many rounds as possible!)  rounds to give you a full-body, high-energy burn for some of the most challenging Metcon in LA. Come get Altered with your Tabata, EMOM, AMRAP, Metcon.")
  end
end

