class ItemsController < ApplicationController
  def create
    @list = List.find(params[:list_id])
    @item = @list.items.create(item_params)
    redirect_to list_path(@list)
  end

  def update
    @list = List.find(params[:list_id])
    @item = @list.items.find(params[:id])
    @item.done = @item.done ? false : true
    @item.save
  end

  private
  def item_params
    params.require(:item).permit(:name, :done)
  end
end
