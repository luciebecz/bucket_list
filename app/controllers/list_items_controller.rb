class ListItemsController < ApplicationController
  before_action :set_bucketlist
  before_action :set_list_item, only: [:show, :edit, :update, :destroy]

  def index 
    @list_items = @bucketlist.list_items
  end 

  def show
  end

  def new
    @list_item = ListItem.new
  end

  def create
    @list_item = @bucketlist.list_items.new(list_item_params)
    if @list_item.save
      flash[:success] = 'List Item Created!'
      redirect_to bucketlist_path(@bucketlist)
    else 
      flash[:error] = 'Not added'
      render :new
    end 
  end 

  def edit
  end

  def update 
    if @list_item.update(list_item_params)
      flash[:success] = 'List Item Updated!'
       redirect_to bucketlist_path(@bucketlist)
    else 
      render :edit
    end 
  end 

  def destroy 
    @list_item.destroy 
    redirect_to bucketlist_list_items_path(@bucketlist)
  end 

  private 

  def list_item_params
    params.require[:list_item].permit(:item_name, :description, :do_by, :bucketlist_id)
  end 

  def set_list_item
    @list_item = @bucketlist.list_items.find(params[:id])
  end 

  def set_bucketlist
    @bucketlist = Bucketlist.find(params[:bucketlist_id])
  end 

end
