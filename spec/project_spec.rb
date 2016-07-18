require('spec_helper')

describe(Project) do
  describe("#division") do
    it("returns the division that the project is in") do
      division1 = Division.create({:name => 'IT'})
      project1 = Project.create({:name => 'clean computers', :division_id => division1.id()})

      expect(project1.division()).to(eq(division1))
    end
  end
  describe("#employees") do
    it("returns the employees in a project") do
      division1 = Division.create({:name => 'IT'})
      project1 = Project.create({:name => 'clean computers', :division_id => division1.id()})
      employee1 = Employee.create({:name => 'matt', :division_id => division1.id(), :project_id => project1.id()})
      employee2 = Employee.create({:name => 'colin', :division_id => division1.id(), :project_id => project1.id()})

      expect(project1.employees()).to(eq([employee1, employee2]))
    end
  end
end
