class UsersController < ApplicationController
  
  before_filter :admin_user,   :only => :destroy
  def index
    @title = "Drinkers"
    @users = User.paginate(:page => params[:page])
   if signed_in?
     @micropost = Micropost.new 
   end
    
   
  end
  def show
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
end

def admin_user
  redirect_to(root_path) unless current_user.admin?
end