class User < ApplicationRecord

  has_one :token
  
  validates :email, :presence => true, 
                    :length => { :minimum => 3, :maximum => 254 },
                    :uniqueness => true
  
  store :messaging_preferences, accessors: [:marketing, :articles, :digest]

  def confirm_token
    @token = Token.find_by(user_id: self.id)
    if (@token == nil || @token.nonce == nil || User.find(@token.user_id).email != self.email)
      return false
    else
      self.unsubscribe_from_all
      Token.consume(@token.nonce)
      return true
    end
  end

  def unsubscribe_from_all
    self.update_attributes!(messaging_preferences: {"marketing"=>false, "articles"=>false, "digest"=>false})
  end

end