require 'sinatra'
require 'sinatra/reloader'
require './lib/Projects'
require './lib/Volunteers'
require 'pry'
require 'pg'

DB = PG.connect({:dbname => 'volunteer_tracker'})

also_reload('lib/**/*.rb')

get('/') do
  @projects = Projects.all
  erb(:index)
end

# Shows available volunteers on projects
get('/projects/:id') do
  @volunteers = Volunteers.all
  @project = Projects.find(params.fetch("id").to_i())
  erb(:projects)
end

# link to the blank volunteer form
get('/volunteer_form') do
  @volunteers = Volunteers.all
  erb(:volunteer_form)
end

post('/volunteer_new') do
  volunteer_new = params.fetch("new_volunteer")
  @volunteer_new = volunteer_new
  new_volunteer = Volunteers.new(:name_volunteer => volunteer_new, :id => nil)
  new_volunteer.save()
  @volunteers = Volunteers.all
  erb(:volunteer_form)
end

get('/project_form') do
  @projects = Projects.all
  erb(:project_form)
end

post('/project_new') do
  project_new = params.fetch("new_project")
  @project_new = project_new
  new_project = Projects.new(:name_project => project_new, :id => nil)
  new_project.save()
  @projects = Projects.all
  erb(:project_form)
end
