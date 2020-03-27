class AddStudentToProfessors < ActiveRecord::Migration[5.1]
  def change
    add_column :professors, :students, :string
  end
end
