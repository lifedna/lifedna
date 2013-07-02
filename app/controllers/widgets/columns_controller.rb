class Widgets::ColumnsController < ApplicationController
  def update
  	@widget = Widget.find params[:id]

  	if @widget.update_attributes(params[@widget.class.to_s.camelize(:lower).to_sym])	
  	  flash[:notice] = "Community has been updated."	
  	  redirect_to community_page_path(@widget.community, @widget.page)
  	end	
  end
end
