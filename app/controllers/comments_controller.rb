class CommentsController < ApplicationController
  before_filter :authenticate_user!
   before_filter :authorized_user, :only => :destroy
   
  def new
     @comment = Comment.new
   end

   
   def create
     @comment  = current_user.comments.build(params[:comment])
     if @comment.save
       flash[:success] = "Comment created!"
       redirect_to posts_path
     else

       render 'pages/home'

     end
   end
   def destroy
     	@comment = Comment.find(params[:id]).destroy
       redirect_to current_user
     end

    private

        def authorized_user
          @comment = current_user.comments.find_by_id(params[:id])
          redirect_to posts_path 

        end
end
