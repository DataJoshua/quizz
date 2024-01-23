module Teachers
  class QuizzesController < ApplicationController
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
      @quiz = Quiz.find(params[:id])

      if update_quiz.success?
        flash[:notice] = "Quiz updated"

        redirect_to dashboard_path
      else
        flash[:notice] = update_quiz.error

        render :edit, status: :unprocessable_entity
      end
    end

    def edit
      @quiz = Quiz.find(params[:id])
    end

    def destroy
      @quiz = Quiz.find(params[:id])

      if destroy_quiz.success?
        flash[:notice] = "quiz deleted"
      else
        flash[:alert] = destroy_quiz.error
      end
      redirect_to dashboard_path
    end

    private

    def create_quiz
      @create_quiz ||= Quizzes::Create.call(quiz: @quiz, user: current_user)
    end

    def update_quiz
      @update_quiz ||= Quizzes::Update.call(quiz: @quiz, quiz_params:)
    end

    def destroy_quiz
      @destroy_quiz ||= Quizzes::Destroy.call(quiz: @quiz)
    end

    def quiz_params
      params.require(:quiz)
            .permit(:name, questions_attributes: [:id,
                                           :content,
                                           :_destroy, 
                                           options_attributes: %i[id _destroy content correct]])
    end
  end
end
