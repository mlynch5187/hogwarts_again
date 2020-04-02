class Professor <ApplicationRecord
  validates_presence_of :name, :age, :specialty

  has_many :professor_students
  has_many :students, through: :professor_students

  def average_age
    average = []
    students.each do |student|
      age_by_length = student.age / students.length
      average << age_by_length
    end
    average.first.to_f.round(2)
  end
end
