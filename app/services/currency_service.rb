class CurrencyService 
  def self.exchange_rate(current, desired)
    get_url("https://api.api-ninjas.com/v1/exchangerate?pair=#{current}_#{desired}") 
  end

  def self.conn 
    Faraday.new(url: "https://api.api-ninjas.com") do |faraday|
      faraday.params["X-Api-Key"] = Rails.application.credentials.currency[:key]
    end
  end

  private

  def self.get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end