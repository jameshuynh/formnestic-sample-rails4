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
  
  def take_quiz
    @quiz_pool = QuizPool.where(id: params[:id]).includes({:quiz_pool_questions => :quiz_pool_question_options}).first
    @quiz_pool_answer_set = QuizPoolAnswerSet.new({quiz_pool: @quiz_pool})
  end
  
  def submit_quiz_answers
    @quiz_pool = QuizPool.find(params[:id])
    @quiz_pool_answer_set = QuizPoolAnswerSet.new(quiz_pool_answer_set_params)
    @quiz_pool_answer_set.quiz_pool = @quiz_pool
    if @quiz_pool_answer_set.save
      redirect_to submit_quiz_answers_thank_you_quiz_pool_url(@quiz_pool)
    else
      render :action => :take_quiz
    end
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
  
  def result
    @quiz_pool = QuizPool.find(params[:id])
  end
  
  def answer_sets_csv
    @quiz_pool = QuizPool.where(id: params[:id]).includes([:quiz_pool_questions, {:quiz_pool_answer_sets => {:quiz_pool_answer_set_answers => :quiz_pool_question_options}}]).first
    send_data @quiz_pool.answer_sets_csv, filename: "#{Time.now.strftime("%Y%m%d%H:%M:%S")}_#{@quiz_pool.title.to_param}_answer_sets.csv"
  end
  
  def view_quiz_answer
    @quiz_pool = QuizPool.find(params[:id])
    @quiz_pool_answer_set = QuizPoolAnswerSet.where(id: params[:quiz_pool_answer_set_id]).includes({quiz_pool_answer_set_answers: [{:quiz_pool_question => :quiz_pool_question_options}, :quiz_pool_question_options]}).first
  end
  
  private
  
  def quiz_pool_answer_set_params
    params.require(:quiz_pool_answer_set).permit([:quiz_taker_name, {
      quiz_pool_answer_set_answers_attributes: [
        :quiz_pool_question_id,
        quiz_pool_question_option_ids: []
      ]
    }])
  end
  
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