class BucketlistsController < ApplicationController
  before_action :set_bucketlist, only: [:show, :edit, :update, :destroy]

  def index
    @bucketlists = Bucketlist.all
    flash[:info] = 'Welcome to the Bucket Lists'
  end

  def show
  end

  def new
    @bucketlist = Bucketlist.new
  end

  def create
    @bucketlist = Bucketlist.new(bucketlist_params)
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
    if Bucklist.update(bucketlist_params)
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
      params.require(:bucketlist).permit(:title)
    end

    def bucketlist_params
      @bucketlist = Bucketlist.find(params[:id])
    end
end
