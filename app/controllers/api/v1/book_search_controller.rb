class Api::V1::BookSearchController < ApplicationController
  def index
    if params[:quantity].to_i > 1
      data, forecast, books = BookFacade.search_book(params[:location], params[:quantity])
    require 'pry'; binding.pry
    end
  end
end