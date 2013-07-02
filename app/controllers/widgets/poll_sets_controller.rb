class Widgets::PollSetsController < ApplicationController
  def update
  	@widget = PollSet.find params[:id]

  	if @widget.update_attributes(params[:poll_set])	
  	  flash[:notice] = "Community has been updated."	
  	  redirect_to community_section_path(@widget.community, @widget.section)
  	end	
  end
end
