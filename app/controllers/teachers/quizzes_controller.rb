module Teachers
  class QuizzesController < ApplicationController
    def index
    end

    def new
      @quiz = Quiz.new
    end

    def create
      @quiz = Quiz.new(quiz_params)

      if create_quiz.success?
        flash[:notice] = "Quiz created successfully"

        redirect_to quizzes_path
      else
        flash[:alert] = create_quiz.error

        render :new, status: :unprocessable_entity
      end
    end

    def update
    end

    def edit
      @quiz = Quiz.find(params[:id])
    end

    private

    def create_quiz
      @create_quiz ||= Quizzes::Create.call(quiz: @quiz)
    end

    def quiz_params
      params.require(:quiz)
            .permit(questions_attributes: [:id,
                                           :content,
                                           :_destroy, 
                                           options_attributes: %i[id _destroy content correct]])
    end
  end
end
