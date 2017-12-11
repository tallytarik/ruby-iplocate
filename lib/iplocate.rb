require "iplocate/version"
require "ipaddress"
require "rest-client"
require "json"
require 'active_support/core_ext/hash/indifferent_access'

module IPLocate
  API_ENDPOINT = "https://www.iplocate.io/api/lookup/";

  def self.lookup(ip_address, api_key = nil)
    # Ensure IP address is valid
    raise "Invalid IP address" if not IPAddress.valid? ip_address

    # Add API key if given
    headers = {}
    if not api_key.nil?
      headers[:"X-API-Key"] = api_key
    end

    # Call the API
    endpoint = "#{API_ENDPOINT}#{ip_address}"
    result = RestClient.get(endpoint, headers)

    # Parse the response
    # Let the parser throw JSON::ParserError on invalid response
    result = JSON.parse(result)

    return result.to_h.with_indifferent_access
  end
end
