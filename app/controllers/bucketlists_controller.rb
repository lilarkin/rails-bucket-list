class BucketlistsController < ApplicationController
  before_action :set_bucketlist, only: [:show, :edit, :update, :destroy]

  def index
    @bucketlists = current_user.bucketlists.paginate(page: params[:page], per_page: 3)
    flash[:info] = 'Welcome to the Bucket Lists'
  end

  def show
  end

  def new
    @bucketlist = Bucketlist.new
  end

  def create
    @bucketlist = current_user.bucketlists.new(bucketlist_params)
    if @bucketlist.save
      flash[:success] = 'New Bucket List Created'
      redirect_to bucketlist_path(@bucketlist)
    else
      flash[:error] = 'Please Try Again'
      render :new
    end
  end

  def edit
  end

  def update
    if @bucketlist.update(bucketlist_params)
      flash[:success] = 'Bucket List Updated'
      redirect_to bucketlist_path(@bucketlist)
    else
      flash[:error] = 'Please Try Again'
      render :edit
    end
  end

  def destroy
    @bucketlist.destroy()
    flash[:success] = 'Bucket List Deleted'
    redirect_to bucketlists_path
  end

  private
   def set_bucketlist
     @bucketlist = Bucketlist.find(params[:id])
   end

   def bucketlist_params
     params.require(:bucketlist).permit(:title)
   end 
end
