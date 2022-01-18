class Api::V1::BookSearchController < ApplicationController
  def index
    if params[:quantity].to_i >= 1
      collection, forecast, books = BookFacade.search_book(params[:location], params[:quantity]).flatten
      render json: BookForecastSerializer.info(collection, forecast, books)
    else
      render json: {error: 'Search quantity must be greater than zero'}
    end
  end
end