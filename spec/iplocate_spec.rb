require "rest-client"

RSpec.describe IPLocate do
  WebMock.allow_net_connect!

  it "has a version number" do
    expect(Iplocate::VERSION).not_to be nil
  end

  describe "lookup" do
    it "should fail with an invalid IP address" do
      expect { IPLocate.lookup("256.256.256.256") }.to raise_error("Invalid IP address")
    end

    it "should add X-API-Key header if api_key provided" do
      expect(RestClient).to receive(:get).with("https://www.iplocate.io/api/lookup/1.2.3.4", { "X-API-Key": "abcdef" }).and_return("{}")

      IPLocate.lookup("1.2.3.4", "abcdef")
    end

    it "should return a valid response for an IPv4 address" do
      result = IPLocate.lookup("8.8.8.8")

      expect(result["ip"]).to eq("8.8.8.8")
      expect(result["country"]).to eq("United States")
      expect(result["country_code"]).to eq("US")
      expect(result["continent"]).to eq("North America")
    end

    it "should return a valid response for an IPv6 address" do
      result = IPLocate.lookup("2001:4860:4860::8888")

      expect(result["ip"]).to eq("2001:4860:4860::8888")
      expect(result["country"]).to eq("United States")
      expect(result["country_code"]).to eq("US")
      expect(result["continent"]).to eq("North America")
    end

    it "should raise an error if the number of requests have been exceeded" do
      stub_request(:get, "https://www.iplocate.io/api/lookup/2.4.6.8")
        .to_return(body: '{ "error": "Rate limit exceeded" }', status: 429)

      expect { IPLocate.lookup("2.4.6.8") }.to raise_error(RestClient::TooManyRequests, "429 Too Many Requests")
    end
  end
end
