Lifedna::Application.routes.draw do
  match '/update' => 'home#update', :as => :update
  match '/features' => 'home#features', :as => :features
  match '/mine' => 'home#mine', :as => :mine	

  authenticated :user do
    root :to => 'home#update'
  end
  root :to => "home#index"
  devise_for :users
  resources :users

  resources :blogs do 
  	get 'comment', :on => :member
  end  

  resources :communities do
    resources :sections

    scope :module => "widgets" do
      resources :bulletins
      resources :forums do
        resources :topics, :posts
      end  
      resources :poll_sets do
        resources :polls
      end 
      resources :qas do
        resources :questions
      end  
      resources :columns do
        resources :articles
      end
    end

    get 'admin', :on => :member
    get 'join', :on => :member
    get 'leave', :on => :member
  end

  resources :phrs do
    scope :module => "phrs" do
      resources :conditions
      resources :symptoms
      resources :treatments
    end
  end
end