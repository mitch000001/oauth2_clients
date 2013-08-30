require 'oauth2'

module GoogleAPI

  attr_reader :client_id, :client_secret, :site, :token_url, :authorize_url

  def initialize client_id, client_secret
    @client_id = client_id
    @client_secret = client_secret
    @site = 'https://accounts.google.com'
    @token_url = '/o/oauth2/token'
    @authorize_url = '/o/oauth2/auth'
  end

  def client
    client = OAuth2::Client.new(
      your_client_id, your_client_secret,
      :site => @site,
      :token_url => @token_url,
      :authorize_url => @authorize_url)
  end

  def auth_token auth_code, redirect_uri
    client.auth_code.get_token(auth_code, redirect_uri: redirect_uri)
  end

end
