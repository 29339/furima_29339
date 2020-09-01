class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update]
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(create_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def index
    @items = Item.all.order("id DESC")
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(create_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  private

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def create_params
    params.require(:item).permit(:image, :name, :story, :category_id, :status_id, :delivery_fee_id, :shipping_address_id, :delivery_date_id, :price).merge(user_id: current_user.id)
  end


  def set_item
    @item = Item.find(params[:id])
  end
end
