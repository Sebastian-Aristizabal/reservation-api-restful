module Authenticable
  def current_user
    return @current_user if @current_user
    # To put .split('').last is very important because the header is like this:
    # "Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE2ODU0MTM2MDd9.KcBdCTjCbpoJ7z0NMBOvn1ttJZ7TCkBIj4t5qdmZGs0"
    # and we need to get the token, so we split the header and get the last part
    # that is because when we send the token in postman we use the Bearer token type
    header = request.headers['Authorization']
    header = header.split(' ').last

    return nil if header.nil?

    decoded = JsonWebToken.decode(header)
    @current_user = User.find(decoded[:user_id]) rescue
    ActiveRecord::RecordNotFound
  end

  protected

  def check_login
    head :forbidden unless self.current_user
  end
end
