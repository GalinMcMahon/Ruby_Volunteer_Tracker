require 'sinatra'
require 'sinatra/reloader'
require './lib/Volunteer_Tracker'
require 'pry'
require 'ps'

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
