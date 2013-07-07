class CommunitiesController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  # load_and_authorize_resource
  
  has_widgets do |root|    
    root << widget(:new_community)
    root << widget(:community_list) 
    root << widget(:section_list, :community => @community)  
  end

  def index
  end

  def show
  	# @community = Community.find(params[:id])
    @community = current_community || not_found
  	@section = @community.sections.first
    # redirect_to section_url(@section)
  	if @section.nil?
  	  if current_user == @community.the_owner
        redirect_to admin_community_url(@community)
      else
        render
      end
  	else
      # redirect_to community_section_url(@community, @section)
      redirect_to section_url(@section)
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

  def not_found
    raise ActionController::RoutingError.new('Community Not Found')
  end
end
