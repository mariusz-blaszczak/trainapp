require 'rails_helper'

feature 'User can see exercises', type: :feature do
  before do
    2.times { create :exercise }
  end
  scenario 'user can see number of exercise' do
    visit 'exercises'
    expect(all('table tbody tr')[0].find('td.js-exercise-index').text).to eq('1')
    expect(all('table tbody tr')[1].find('td.js-exercise-index').text).to eq('2')
  end
end
