require('spec_helper')

describe(Division) do
  describe("#employees") do
    it "finds the employees associated with a division" do
      test_division = Division.create({:name => "Software"})
      test_employee1 = Employee.create({:name => "Carl", :division_id => test_division.id})
      test_employee2 = Employee.create({:name => "Tricia", :division_id => test_division.id})
      expect(test_division.employees()).to(eq([test_employee1, test_employee2]))
    end
  end
end
