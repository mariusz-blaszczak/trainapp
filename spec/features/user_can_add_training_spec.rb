require 'rails_helper'

feature 'User can add training', type: :feature do

  scenario 'user can add new training' do
    visit 'trainings'
    find('.js-add-new-button').click
    expect(page).to have_content('Dodaj nowy trening')
    find('.js-training-name-input').set('training name')
    find('.js-save-button').click
    expect(page).to have_content('Trening został utworzony')
    expect(page).to have_content('training name')
    # visit 'trainings/1/edit'
  end

end
