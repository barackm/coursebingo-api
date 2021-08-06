class AuthorizeApiRequest
  attr_reader :headers

  def initialize(headers = {})
    @headers = headers
  end

  def call
    user
  end

  def user
    @user ||= User.find(decoded_token[:id]) if decoded_token.present?
  end

  def decoded_token
    @decoded_token ||= JsonWebToken.decode(http_header)
  end

  def http_header
    @headers['Authorization'] if @headers['Authorization'].present?
  end
end
