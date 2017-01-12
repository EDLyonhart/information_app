class Token < ApplicationRecord

  belongs_to :user

  def self.generate(user)

    if Token.exists?(:user_id => user.id)
      return "User already has an associated token"
    else
      token = Token.new
      token.nonce = SecureRandom.base64(64)
      token.user_id = user.id
      token.save

      token
    end
  end

  def self.consume(nonce)
    token = Token.find_by(:nonce => nonce)

    token.delete && token.user unless !token
  end

end

