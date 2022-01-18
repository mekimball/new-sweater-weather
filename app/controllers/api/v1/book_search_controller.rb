class Api::V1::BookSearchController < ApplicationController
  def index
    if params[:quantity].to_i > 1
      data, forecast, books = BookFacade.search_book(params[:location], params[:quantity])
    require 'pry'; binding.pry
    else
      render json: {error: 'Search quantity must be greater than zero'}
    end
  end
end