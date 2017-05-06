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

get("/projects/:id") do
  @project = Projects.find(params.fetch("id").to_i())
  erb(:projects)
end

# get("/volunteers/:id") do
#   @volunteers = Projects.find(params.fetch("id").to_i())
#   erb(:projects)
# end
# get('/:id') do
#   @project = Projects.params.fetch('id').to_i
#   erb(:projects)
# end

# POST FROM volunteer_form.erb

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



# post('/new_patron_form') do
#   patron_new = params.fetch("patron_name")
#   @patron_name = patron_new
#   new_patron = Patrons.new(patron_new)
#   new_patron.save()
#   erb(:patron_welcome)
# end



# post('/definitions') do
#   definition = params.fetch('inputted_definition')
#   @definition = Definitions.new(definition)
#   @definition.save()
#   @word = Words.find(params.fetch('word_id').to_i())
#   @word.add_definition(@definition)
#   @words = Words.all()
#   erb(:words)


        # POST FROM project_form.erb
# post('/project_new') do
#
# end
