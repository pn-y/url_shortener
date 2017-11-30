class VisitCreator
  def initialize(link, ip)
    @link = link
    @ip = ip
  end

  def call
    country = get_country
    create_visit(country)
  end

  private

  def get_country
    uri = URI("http://freegeoip.net/json/#{ip}")
    response = Net::HTTP.get_response(uri)

    return { error: response.message } unless response.code == '200'

    { result: JSON.parse(response.body)['country_name'] }

  rescue Net::HTTPError, JSON::ParserError => e
    return { error: e }
  end

  def create_visit(country)
    if country[:error]
      Rails.logger.error country[:error]
      link.visits.create(ip: ip)
    elsif country[:result]
      link.visits.create(ip: ip, country: country[:result])
    end
  end

  attr_reader :link, :ip
end
