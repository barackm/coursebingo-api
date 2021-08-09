class JsonWebToken
  # secret to encode and decode token
  HMAC_SECRET = ENV['secret_key_base'] || Rails.application.secret_key_base

  def self.encode(payload, exp = 24.hours.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, HMAC_SECRET)
  end

  def self.decode(token)
    begin 
      decoded = JWT.decode(token, HMAC_SECRET)[0]
      HashWithIndifferentAccess.new decoded
    rescue
      return nil
    end
  end
end
