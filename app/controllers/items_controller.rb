class ItemsController < ApplicationController
  def index
    @items = Item.all.order('pub_date desc')
  end

  def show
    @item = Item.find(params[:id])
  end
end
