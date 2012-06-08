class EventsController < ApplicationController
	before_filter :authenticate_user!, :only => :show
  before_filter :admin_user,   :only => [:edit, :destroy, :new]
  def new
  	@event = Event.new
  	@title = "Host an event"
  	if signed_in?
      @micropost = Micropost.new
    end
  end
  
  def show
  	@event = Event.find(params[:id])
	@title = @event.name
	@paricipation = Participation.all
  @users = @event.users.all
	if signed_in?
      @micropost = Micropost.new
    end
  end
  
  def index
  	@title = "Tasting Events"
  	@events = Event..order("id DESC").all
  	 if signed_in?
      @micropost = Micropost.new
    end
   
  end
  
  def create
  	@event = Event.new(params[:event])
  	
  	  if @event.save 
  	   
  	   flash[:success] = "You're now hosting an event!"
       redirect_to @event
    else
      @title = "Host your own event"
      render 'new'
    end
  end
  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to @event, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end
  def edit
    @event = Event.find(params[:id])
  end
  
  def destroy
    @event = Event.find(params[:id]).destroy
    redirect_to events_path
  end
  
  def admin_user
    redirect_to(root_path) unless current_user.admin?
  end
end
