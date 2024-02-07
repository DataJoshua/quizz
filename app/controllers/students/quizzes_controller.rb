module Students
  class QuizzesController < ApplicationController
    def show
      @quiz = Quiz.find(params[:id]).decorate
    end
  end
end
