class ListsController < ApplicationController
  def index
    @lists = List.all
    @list = List.new
  end

  def show
    @lists = List.all
    @list = List.find(params[:id])
  end

  def new
    @lists = List.all
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.save
    redirect_to @list
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to lists_path
  end

  private
  def list_params
    params.require(:list).permit(:name)
  end
end
