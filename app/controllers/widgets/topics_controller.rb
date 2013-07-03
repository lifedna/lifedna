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
  	  current_user.publish_activity(:new_topic, :object => @topic, :target_object => @forum.community)
      redirect_to community_section_path(@forum.community, @forum.section)
  	else
  	  flash[:notice] = "Failed to save topic."	  
  	  render :action => :new
  	end
  end	

  def show
    @topic = Topic.find params[:id]
  end

  def update
  	@widget = Widget.find params[:id]

  	if @widget.update_attributes(params[@widget.class.to_s.camelize(:lower).to_sym])	
  	  flash[:notice] = "Project has been updated."	
  	  redirect_to community_section_path(@widget.community, @widget.section)
  	else
  	  flash[:notice] = "Failed to save topic."	  
  	end	
  end	

  def destroy
  end	
end