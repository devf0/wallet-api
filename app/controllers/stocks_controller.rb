class StocksController < ApplicationController
  skip_before_action :authenticate_request

  def price
    symbol = params[:symbol]
    @stock_price = LatestStockPrice.price(symbol)
    render json: @stock_price.to_json
  end

  def all
    @stocks_price = LatestStockPrice.price_all
    render json: @stocks_price.to_json
  end
end