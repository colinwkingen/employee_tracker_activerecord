require('spec_helper')

describe(Employee) do
  describe("#division") do
    it("returns the divisions that the employee works in")  do
      division1 = Division.create({:name => 'IT'})
      employee1 = Employee.create({:name => 'matt', :division_id => division1.id()})
      expect(employee1.division()).to(eq(division1))
    end
  end
  describe('#projects') do
    it "returns the project that a specific employee is working on" do
      project1 = Project.create({:name => 'Making Ham', :division_id => 1})
      employee1 = Employee.create({:name => 'matt', :division_id => 1, :project_id => project1.id()})
      expect(employee1.project).to(eq(project1))
    end
  end
end
