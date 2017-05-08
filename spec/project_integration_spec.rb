require "capybara/rspec"
require "./app"

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('seeing details for a single project', {:type => :feature}) do
  it('allows a user to click a project to see the volunteers for it') do
    test_project = Projects.new({:name_project => 'Ivy Removal', id: nil})
    test_project.save()
    visit('/')
    expect(page).to have_content(test_project.name_project())
  end
end
