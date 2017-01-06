## The Information Code Challenge

Email is a critical communications channel for The Information. We email our subscribers when an article publishes, we send a digest of the week's news every Saturday so subscribers can catch up on anything they may have missed, and we also periodically send marketing messages with special offers.

It's very important to our subscribers' happiness and success that they have fine-grained, seamless control over which messages they receive. For this code challenge, your mission is to build a Rails app that permits users to make changes to what types of messages they receive.

You should submit a functioning Ruby on Rails app with the following features:
 
### 1. A _User_ model.

_User_ should contain a name, email address, and booleans controlling whether a user should receive messages from three different email channels:
  - marketing,
  - articles,
  - digest.

No two accounts should be able to share the same email address.

### 2. A _Token_ model.

_Token_ should contain a string property called "nonce" and a reference to the User model.
_Token_ should implement the following methods:
- a static method, _generate_, which takes a User object and returns a new Token referring to that user as well as a long, secure random string in the "nonce" property.
- a static method, _consume_, which looks for a Token by its nonce. If it finds the token, it should delete it and return the associated User object. Otherwise it should return nil.

### 3. A view to change email settings.
Build a full route, including controller and view, from which a user can change their email address and toggle each of the email channels listed above on or off. There should be both individual controls and a single toggle marked "do not email" that turns them all off.

The view should have two query parameters, _email_ and _token_. If _email_ does not correspond to the email address of an existing user object, or "token" does not contain the nonce of a token that points to the same account, no changes should be accepted.

If the user tries to choose an email address which is already assigned to another user in the system, it should display an error.

### 4. Data fixtures.

We'd like to be able to see your creation in action from the get-go, so please provide fixtures for both _User_ and _Token_. You can feel free to use the built-in Rails tooling for this, or any other technique you'd like to seed the data.