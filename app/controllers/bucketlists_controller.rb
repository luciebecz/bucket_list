class BucketlistsController < ApplicationController
  before_action :set_bucketlist, only: [:show, :edit, :update, :destroy]
  def index
    @bucketlists = current_user.bucketlists
  end

  def show
  end

  def new
    @bucketlist = current_user.bucketlists.new
  end

  def create
    @bucketlist = current_user.bucketlists.new(bucketlist_params)
    if @bucketlist.save 
      flash[:success] = 'New Bucket List Added!'
      redirect_to bucketlist_path(@bucketlist)
    else 
      render :new
    end 
  end 

  def edit
  end

  def update 
    if @bucketlist.update(bucketlist_params)
      redirect_to bucketlist_path(@bucketlist), success: 'Bucket List Updated!'
    else 
      render :edit 
    end 
  end 

  def destroy 
    @bucketlist.destroy
      redirect_to bucketlists_path, success: 'Bucket List Deleted'
  end 

  private 
    def bucketlist_params
      params.require(:bucketlist).permit(:name)
    end 

    def set_bucketlist
      @bucketlist = Bucketlist.find(params[:id])
    end 

end
