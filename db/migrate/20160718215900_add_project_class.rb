class AddProjectClass < ActiveRecord::Migration
  def change
    create_table(:projects) do |t|
      t.column(:name, :string)
      t.column(:division_id, :integer)
    end
    add_column(:employees, :project_id, :integer)
  end
end
