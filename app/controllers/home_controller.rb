class HomeController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :communities]

  def index
    @users = User.all
  end

  def update
  end
  
  def features
    if params[:category]
      @blogs = Blog.where(category: params[:category])
    else
      @blogs = Blog.all
    end  
  end

  def mine
  end	
end
