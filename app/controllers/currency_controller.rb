class CurrencyController < ApplicationController
  def show 
    @exchange_rate = CurrencyFacade.currency_exchange(params[:current_cur], params[:desired_cur]) 
    @current = params[:current_cur]
    @desired = params[:desired_cur]
  end
end