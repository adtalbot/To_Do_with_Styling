require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the to do website path', :type => :feature) do
  it('allows a user to create lists of tasks') do
    visit('/')
    fill_in('name', :with => 'School stuff')
    click_button('Add')
    expect(page).to have_content('School stuff')
  end
end
