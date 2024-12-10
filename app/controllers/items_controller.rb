class ItemsController < ApplicationController
  before_action :set_item

  def index
    @items = Item.all
  end
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
  end

  private

  def item_params
    params.require(:item).permit(:content, :user_id, :event_id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end