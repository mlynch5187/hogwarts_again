class ProfessorController < ApplicationController

  def index
    @professors = Professor.all
  end

end
