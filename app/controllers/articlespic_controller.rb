class ArticlespicController < ApplicationController
	 respond_to :js, :html
  def edit
    @article=Article.find(params[:id])
    if signed_in?
      @micropost = Micropost.new
    end
  end
  def articlepic
   
    articlepichash=params[:articlepic]
    article_id=articlepichash[:article_id]
    @article=Article.find(article_id)
    @article.articlepic = articlepichash[:image]
    
    @article.save(:validate => false)
    
    redirect_to @article
    
  end
  def update
    @article=Article.find(params[:id])
    if @article.update_attributes
      flash[:notice]='made articlepic'
      redirect_to article_path(@article)
    else
      flash[:error]='didnt'
      render :action => 'new'
    end
  end
  def show
  end
end
