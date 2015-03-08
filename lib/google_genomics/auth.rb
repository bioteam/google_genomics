module GoogleGenomics
  class Auth

    attr_accessor :api, :client
    cattr_accessor :api, :client

    def initialize
      @config = GoogleGenomics::Config
      @key = Google::APIClient::KeyUtils.load_from_pkcs12(@config.key_file, @config.pass_phrase)
      @asserter = Google::APIClient::JWTAsserter.new( @config.email, @config.scope, @key)
    end

    def authorize
      @client = Google::APIClient.new(application_name: "BigSista", application_version: '1.0' )
      @client.authorization = @asserter.authorize
      @client.retries = @config.retries.to_i if @config.retries.to_i > 1
      @api = @client.discovered_api('genomics', 'v1beta2')
      self.class.api = @api
      self.class.client = @client
    end

    def self.authorized?
      client.present?
    end

  end
end
