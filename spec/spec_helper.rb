ENV['RACK_ENV'] = 'test'
require("rspec")
require("pg")
require("sinatra/activerecord")
require("employee")
require("division")
require("project")
require('pry')

RSpec.configure do |config|
  config.after(:each) do
    Employee.all().each() do |this_employee|
      this_employee.destroy()
    end
    Division.all().each() do |this_division|
      this_division.destroy()
    end
    Project.all().each() do |this_project|
      this_project.destroy()
    end
  end
end
