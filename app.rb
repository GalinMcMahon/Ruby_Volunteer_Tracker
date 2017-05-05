require 'sinatra'
require 'sinatra/reloader'
require './lib/Projects'
require './lib/Volunteers'
require 'pry'
require 'pg'

DB = PG.connect({:dbname => 'volunteer_tracker'})

also_reload('lib/**/*.rb')

get('/') do
  erb(:index)
end



        # POST FROM project_form.erb
# post('/project_new') do
#
# end

#       POST FROM volunteer_form.erb
# post('/volunteer_new') do
#
# end
