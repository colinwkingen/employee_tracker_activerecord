
require('sinatra')
require('sinatra/reloader')
require("sinatra/activerecord")
require('./lib/division')
require('./lib/employee')
also_reload('lib/**/*.rb')
require('pg')

get('/') do
  @divisions = Division.all()
  erb(:index)
end

post('/HR/division/create') do
  division_name = params.fetch("division")
  Division.create({:name => division_name})
  @divisions = Division.all()
  erb(:index)
end

get('/HR/division/:id') do
  id = params.fetch("id").to_i()
  @division = Division.find(id)
  erb(:division)
end

delete('/remove_employee/:id') do
  id = params.fetch("id").to_i()
  this_employee = Employee.find(id)
  division_id = this_employee.division().id
  this_employee.destroy()
  @division = Division.find(division_id)
  erb(:division)
end

post('/add_employee/:id') do
  new_employee = params.fetch('employee')
  id = params.fetch('id').to_i()
  Employee.create({:name => new_employee, :division_id => id})
  @division = Division.find(id)
  erb(:division)
end
