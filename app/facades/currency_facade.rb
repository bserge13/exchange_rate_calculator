class CurrencyFacade 
  def self.currency_exchange(current, desired) 
    data = CurrencyService.exchange_rate(current, desired) 
    Currency.new(data) 
  end
end