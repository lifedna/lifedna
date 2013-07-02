class Widgets::QuestionsController < ApplicationController
  def index
  end

  def new
    @qa = Qa.find params[:qa_id]
    @question = Question.new
    @question.title = params[:title]
  end

  def create
    @qa = Qa.find params[:qa_id]
    @question = Question.new(params[:question])
    if @question.save 
      flash[:notice] = "Question saved successfully."
      # render :action => :show
      redirect_to community_page_path(@qa.community, @qa.page)
    else
      flash[:notice] = "Failed to save question."    
      render :action => :new
    end
  end

  def show
  end

  def update
  end

  def destroy
  end
end
