require "capybara/rspec"
require "./app"

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('seeing details for a single project', {:type => :feature}) do
  it('allows a user to click a project to see the volunteers for it') do
    test_project = Projects.new({:name_project => 'Ivy Removal', id: nil})
    test_project.save()
    # test_volunteer = Volunteers.new({:name_volunteer => "Joe Smith", id: nil, :project_id => test_project.id()})
    # test_volunteer.save()
    visit('/')
    expect(page).to have_content(test_project.name_project())
  end
end

# describe('seeing details for a single list', {:type => :feature}) do
#   it('allows a user to click a list to see the tasks and details for it') do
#     test_list = List.new({:name => 'School stuff'})
#     test_list.save()
#     test_task = Task.new({:description => "learn SQL", :list_id => test_list.id()})
#     test_task.save()
#     visit('/lists')
#     click_link(test_list.name())
#     expect(page).to have_content(test_task.description())
#   end
# end
