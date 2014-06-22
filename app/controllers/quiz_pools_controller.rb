class QuizPoolsController < ApplicationController
  
  def index
    @quiz_pools = QuizPool.all
  end
  
  def new
    @quiz_pool = QuizPool.new
    @quiz_pool.quiz_pool_questions = [QuizPoolQuestion.new, QuizPoolQuestion.new]
  end
  
  def edit
    @quiz_pool = QuizPool.find(params[:id])    
  end
  
  def create
    @quiz_pool = QuizPool.new(quiz_pool_params)
    if @quiz_pool.save
      redirect_to '/'
    else
      render :action => :new      
    end
  end
  
  def update
    @quiz_pool = QuizPool.find(params[:id])
    if @quiz_pool.update_attributes(quiz_pool_params)
      redirect_to quiz_pools_url
    else
      render :action => :edit
    end
  end
  
  def destroy
    @quiz_pool = QuizPool.find(params[:id])
    @quiz_pool.destroy
    redirect_to quiz_pools_url
  end
  
  private
  
  def quiz_pool_params
    params.require(:quiz_pool).permit([:title, :description, {
      :quiz_pool_questions_attributes => [
        :description,
        :score,
        :_destroy,
        :id,
        {
          :quiz_pool_question_options_attributes => [
            :description,
            :is_correct,
            :_destroy,
            :id
          ]
        }
      ]
    }])
  end
end