class User < ApplicationRecord

  has_one :token
  
  validates :email, :presence => true, 
                    :length => { :minimum => 3, :maximum => 254 },
                    :uniqueness => true
                    # :email => true
  
  store :messaging_preferences, accessors: [:marketing, :articles, :digest]

  after_initialize :initialize_defaults, :if => :new_record?

  def confirm_token
    @token = Token.find_by(user_id: self.id)
    if (@token.nonce == nil || User.find(@token.user_id).email != self.email)
      return false
    else
      self.unsubscribe_from_all
      Token.consume(@token.nonce)
      return true
    end
  end

  def unsubscribe_from_all
    self.update_attributes!(messaging_preferences: {"marketing"=>"false", "articles"=>"false", "digest"=>"false"})
  end

  private

    def initialize_defaults
      self.marketing = false
      self.articles = false
      self.digest = false
    end

end