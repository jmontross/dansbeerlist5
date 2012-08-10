class ArticlesController < ApplicationController
  before_filter :authenticate_user!, :only => :show
  before_filter :admin_user,   :only => [:edit, :destroy, :new]
  def new
  	@article = Article.new
  	@title = "Write an Article"
  	if signed_in?
      @micropost = Micropost.new
    end
  end
  
  def show
  	@article = Article.find(params[:id])
	  @title = @article.title
    if signed_in?
      @micropost = Micropost.new
    end
  end
  
  def index
  	@title = "News"
  	@articles = Article.all
  	 if signed_in?
      @micropost = Micropost.new
    end
   
  end
  
  def create
  	@article = Article.new(params[:article])
  	  if @article.save    
  	   flash[:success] = "You just posted an article!!"
       redirect_to @article
    else
      @title = "Write an Article"
      render 'new'
    end
  end
  
  def update
    @article = Article.find(params[:id])

    respond_to do |format|
      if @article.update_attributes(params[:article])
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def edit
    @article = Article.find(params[:id])
  end
  
  def destroy
    @article = Article.find(params[:id]).destroy
    redirect_to articles_path
  end
  
  def admin_user
    redirect_to(root_path) unless current_user.admin?
  end
  
end
