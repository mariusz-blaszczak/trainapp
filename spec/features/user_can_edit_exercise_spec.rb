require 'rails_helper'

feature 'User can edit exercise', type: :feature do
  before { create :exercise, name: 'exercise1', double_sided: false }
  scenario 'user can change double sided' do
    visit 'exercises'
    find('.js-edit-button').click
    expect(page).to have_content('Edytuj ćwiczenie')
    find('.js-double-sided-checkbox-input').set(true)
    find('.js-save-button').click
    expect(page).to have_content('Ćwiczenie zostało zaktualizowane')
    visit 'exercises/1/edit'
    expect(find('.js-double-sided-checkbox-input')['checked']).to eq(true)
    find('.js-double-sided-checkbox-input').set(false)
    find('.js-save-button').click
    visit 'exercises/1/edit'
    expect(find('.js-double-sided-checkbox-input')['checked']).to eq(false)
  end
end
