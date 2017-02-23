class Api::V1::ItemsController < ApplicationController

  def index
    render json: Item.all
  end

  def show
    render json: Item.find(params[:id])
  end

  def create
    item = Item.new(item_params)
    render json: item, status: 201
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    render json: "removed", status: :no_content
  end

  private
    def item_params
      params.permit(:name, :description)
    end
end