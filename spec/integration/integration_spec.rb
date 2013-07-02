ENV['RACK_ENV'] = 'test'

require 'rspec'
require 'capybara/rspec'

require_relative '../../lib/controllers/main'


Capybara.app = Main

describe 'display_results', :type => :feature do

  it 'should render a page with any results' do
    visit "/display_results?search=ruby"
    page.should have_content("ISBN")
  end

  it 'should render a page with a defined number of results' do
    visit "/display_results?search=ruby&count=7"
    page.should have_content("ISBN", :count => 7)
  end

    it 'should render a page with a defined number of results' do
    visit "/display_results?search=ruby"
    page.should have_content("ISBN", :count => 10)
  end

end