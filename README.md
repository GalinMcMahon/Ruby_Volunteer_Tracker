# VOLUNTEER TRACKER

App allows a non-profit to track their projects and their volunteers.

### Prerequisites

~~~~
Web browser with ES6 compatibility
Examples: Chrome, Safari
Ruby 2.2.2
Bundler
~~~~

### Installing

Clone this repository to your machine.  Navigate to the file path in your terminal and run 'app.rb' by typing:
~~~~
$ruby app.rb
~~~~
Copy into your browser:
~~~~
localhost://4567
~~~~

### Creating the Database in SQL

Run psql (In one terminal window type: postgres.  In a second terminal window type: psql.)
In psql, enter the following lines:
~~~sql
CREATE DATABASE volunteer_tracker;
\c volunteer tracker;
CREATE TABLE projects (id serial PRIMARY KEY, name_project varchar, volunteers_id int);
CREATE TABLE volunteers (id serial PRIMARY KEY, name_volunteer varchar, projects_id int);
~~~

## Built With

~~~~
* Ruby
* Sinatra
* HTML
* CSS
* Bootstrap https://getbootstrap.com/
* SQL
~~~~

## Specifications

| behavior |  input   |  output  |
|----------|:--------:|:--------:|
|Allow employee to view projects|View|"Project"|
|Allow employee to add projects|""|"Project Name"|
|Allow employee to update projects|"Project Name"|"Project New Name"|
|Allow employee to delete projects|"Project New Name"|""|
|Allow employee to view volunteers|View|"Bob Jones"|
|Allow employee to add volunteers|""|"Susan Smith"|
|Allow employee to update volunteers|"Susan Smith"|"Susan Jones"|
|Allow employee to delete volunteers|"Susan Jones"|""|
|Allow employee to add volunteers to a project|"Project"|"Project - Bob Jones"|

## Authors

* Galin McMahon

## License

Open Source

Copyright © 2017 Galin McMahon
