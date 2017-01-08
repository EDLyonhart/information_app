class Token < ApplicationRecord

  belongs_to :user
  # after_initialize :initialize_defaults, :if => :new_record?


  def self.generate(user)
    @user = user
    
    if Token.exists?(:user_id => user.id)
      p "User already has an associated token"
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

    if token != []
      user = User.where(:id => token["user_id".to_i])
      token.delete      
      
      user
    else
      nil
    end
  end

end
