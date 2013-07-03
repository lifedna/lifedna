class CommunitiesController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  
  has_widgets do |root|    
    root << widget(:new_community)
    root << widget(:community_list) 
    root << widget(:section_list, :community => @community)  
  end

  def index
  end

  def show
  	@community = Community.find(params[:id])
  	@section = @community.sections.first
  	if @section.nil?
  	  redirect_to admin_community_url
  	else
      redirect_to community_section_url(@community, @section)
  	end
  end  

  def admin
  	@community = Community.find(params[:id])
  end

  def join
    @community = Community.find(params[:id])
    @community.users << current_user
    @community.save
    redirect_to :action => "index"
  end

  def leave
    @community = Community.find(params[:id])
    @community.users.delete(current_user)
    @community.save
    redirect_to :action => "index"
  end
end
