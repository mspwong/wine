# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_wine_session',
  :secret      => '66943cba62ecebee246dbe6f7c3f34fbfbcbb7e81fceb4a24e331f8aa52d342ed1d156087d1803461e24983e6ebfdf3932ee94523e7f3fc1db53feea5d4ad609'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
