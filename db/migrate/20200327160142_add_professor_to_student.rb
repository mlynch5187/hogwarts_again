class AddProfessorToStudent < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :professor, :string
  end
end
