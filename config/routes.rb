Rails.application.routes.draw do
  resources :quiz_pools do
    member do
      get :take_quiz
      get :result
      get :preview
      post :submit_quiz_answers
      get :submit_quiz_answers_thank_you
      get :view_quiz_answer
      get :answer_sets_csv
    end
  end
  root :to => 'quiz_pools#index'
end
