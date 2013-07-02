class Widgets::TopicsController < ApplicationController
  def new
  	@forum = Forum.find params[:forum_id]
  	@topic = Topic.new
  end

  def create
  	@forum = Forum.find params[:forum_id]
  	@topic = Topic.new(params[:topic])
  	if @topic.save 
  	  flash[:notice] = "Topic saved successfully."
  	  # render :action => :show
      redirect_to community_page_path(@forum.community, @forum.page)
  	else
  	  flash[:notice] = "Failed to save topic."	  
  	  render :action => :new
  	end
  end	

  def show
  end

  def update
  	@widget = Widget.find params[:id]

  	if @widget.update_attributes(params[@widget.class.to_s.camelize(:lower).to_sym])	
  	  flash[:notice] = "Project has been updated."	
  	  redirect_to community_page_path(@widget.community, @widget.page)
  	else
  	  flash[:notice] = "Failed to save topic."	  
  	end	
  end	

  def destroy
  end	
end