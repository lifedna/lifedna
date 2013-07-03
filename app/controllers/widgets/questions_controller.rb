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
      current_user.publish_activity(:new_question, :object => @question, :target_object => @qa.community)
      redirect_to community_section_path(@qa.community, @qa.section)
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
