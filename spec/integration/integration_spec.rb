ENV['RACK_ENV'] = 'test'

require 'rspec'
require 'capybara/rspec'

require_relative '../../lib/controllers/main'


Capybara.app = Main

describe 'display_results', :type => :feature do

  it 'should contain the string program' do
    visit "/display_results"
    page.should have_content("Program")
  end

end