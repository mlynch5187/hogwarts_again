class ProfessorController < ApplicationController

  def index
    @professors = Professor.all
  end

  def show
    # @professors = Professor.find(params[:id])
    # require "pry"; binding.pry
    # @students = Student.find(params[:student_id])
    # @students = Student.where(id: "11")
  end

end
