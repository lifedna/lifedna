# 
class Widgets::ArticlesController < ApplicationController
  def new
    @column = Column.find params[:column_id]
    @article = Article.new
  end

  def create
    @column = Column.find params[:column_id]
    @article = Article.new(params[:article])
    if @article.save 
      flash[:notice] = "Article saved successfully."
      # render :action => :show
      redirect_to community_section_path(@column.community, @column.section)
    else
      flash[:notice] = "Failed to save article."    
      render :action => :new
    end
  end

  def show
  end

  def update
    @widget = Widget.find params[:id]

    if @widget.update_attributes(params[@widget.class.to_s.camelize(:lower).to_sym])  
      flash[:notice] = "Community has been updated."  
      redirect_to community_section_path(@widget.community, @widget.section)
    else
      flash[:notice] = "Failed to save article."    
    end
  end

  def destroy
  end
end