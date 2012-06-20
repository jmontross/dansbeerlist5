class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :admin_user,   :only => :destroy
  def index
    @title = "Drinkers"
    @users = User.paginate(:page => params[:page])
   if signed_in?
     @micropost = Micropost.new 
   end
    
   
  end
  def show
    @title = "Profile"
    @user = User.find(params[:id])
    @microposts = @user.microposts
   if signed_in?
     @micropost = Micropost.new
   end
  end
  
  def edit
    @title = "Edit profile"
    if signed_in?
      @micropost = Micropost.new
    end
  end
  
  def destroy
    @user = User.find(params[:id]).destroy
    redirect_to users_path
  end
  
  def admin_user
    redirect_to(root_path) unless current_user.admin?
  end

  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.following
    if signed_in?
      @micropost = Micropost.new
    end
    render 'show_follow'
    
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers
    if signed_in?
      @micropost = Micropost.new
    end
    render 'show_follow'
  end
  

end