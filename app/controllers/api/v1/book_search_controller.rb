class Api::V1::BookSearchController < ApplicationController
  def index
    if params[:quantity].to_i >= 1
      collection, forecast, books = BookFacade.search_book(params[:location], params[:quantity])
      render json: {data: { id: 'null', type: 'books', attributes: {destination: params[:location], forecast: {summary: forecast.conditions, temperature: forecast.temperature}, total_books_found: collection[:numFound], books: books}}}
    else
      render json: {error: 'Search quantity must be greater than zero'}
    end
  end
end