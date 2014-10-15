require 'json'

module PhysicianCompare
  class Api

    BASE_URL = 'http://data.medicare.gov/resource/s63f-csi6.json'

    def fetch_physicians(params = {})
      uri = url(params)
      JSON.parse(Net::HTTP.get(uri))
    end
    private

    def url(params)
      if params.empty?
        URI(BASE_URL)
      else
        URI("#{BASE_URL}?#{URI.encode_www_form(params)}")
      end
    end
  end
end