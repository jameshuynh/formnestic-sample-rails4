class QuizPoolsController < ApplicationController
  def new
    @quiz_pool = QuizPool.new
    @quiz_pool.quiz_pool_questions = [QuizPoolQuestion.new, QuizPoolQuestion.new]
  end
  
  def create
    @quiz_pool = QuizPool.new(quiz_pool_params)
    if @quiz_pool.save
      redirect_to '/'
    else
      render :action => :new      
    end
  end
  
  private
  
  def quiz_pool_params
    params.require(:quiz_pool).permit([:title, :description, {
      :quiz_pool_questions_attributes => [
        :description,
        :score,
        {
          :quiz_pool_question_options_attributes => [
            :description,
            :is_correct
          ]
        }
      ]
    }])
  end
end