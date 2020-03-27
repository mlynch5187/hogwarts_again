class ProfessorController < ApplicationController

  def index
    @professors = Professor.all
  end

  def show
    teacher = Professor.find(params[:id])
    @students = Student.where(professor: teacher)
  end

end
