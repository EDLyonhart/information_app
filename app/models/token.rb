class Token < ApplicationRecord

  belongs_to :user
  # after_initialize :initialize_defaults, :if => :new_record?


  def self.generate(user)
    @user = user
    
    if Token.exists?(:user_id => user.id)
      p "User already has an associated token"
    else
      @token = Token.new
      @token.nonce = SecureRandom.base64(64)
      @token.user_id = user.id
      @token.save

      @token
    end
  end

  def self.consume(nonce)
    token = Token.where(:nonce => nonce)

    if token != []
      user = User.where(:id => token["user_id".to_i])
      Token.find(token["id".to_i]).delete      
      
      user
    else
      nil
    end
  end

end

