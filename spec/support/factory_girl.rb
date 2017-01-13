RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end

# RSpec without Rails
# RSpec.configure do |config|
#   config.include FactoryGirl::Syntax::Methods

#   config.before(:suite) do
#     FactoryGirl.find_definitions
#   end
# end

FactoryGirl.define do
  # create a user
  factory :user do |u|
    u.name "Test User"
    u.email  "factory_girl_test_email1@email.com"
    u.messaging_preferences({marketing: false, articles: false, digest: true})
  end

  # Create a token
  factory :token do
    nonce "asdf1234"
    user_id 987654321
  end
end