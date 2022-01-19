class Api::V1::BackgroundsController < ApplicationController

  def index
    render json: {data: { id: 'null', type: 'image', attributes: { image: BackgroundsFacade.get_background(params[:location])}}}
  end
end