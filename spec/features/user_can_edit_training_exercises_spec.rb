require 'rails_helper'

feature 'User can edit training exercises', type: :feature do
  before do
    create(:training, name: 'name1', id: 1)
    create(:exercise, name: 'exercise1')
  end

  scenario 'user can change series number' do
    visit 'trainings/1/edit'
    find('table.js-training-exercises-table tbody tr input.js-series-number-input').set(10)
    find('.js-save-button').click
    visit 'trainings/1/edit'
    expect(find('table.js-training-exercises-table tbody tr input.js-series-number-input').value)
      .to eq('10')
  end

  scenario 'user can change duration' do
    visit 'trainings/1/edit'
    find('table.js-training-exercises-table tbody tr input.js-duration-input').set(10)
    find('.js-save-button').click
    visit 'trainings/1/edit'
    expect(find('table.js-training-exercises-table tbody tr input.js-duration-input').value)
      .to eq('10')
  end
end
