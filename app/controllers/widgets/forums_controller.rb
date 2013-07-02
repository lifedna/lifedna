class Widgets::ForumsController < ApplicationController

  def update
  	@widget = Widget.find params[:id]

  	if @widget.update_attributes(params[:forum])	
  	  flash[:notice] = "Community has been updated."	
  	  redirect_to community_section_path(@widget.community, @widget.section)
  	end	
  end	
end
