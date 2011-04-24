# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_gramiejska_session',
  :secret      => '8b105a6e5b916c2075fa4c675035e600eed051e4e249edaba36bcf903070a6ad0dc1e8b8f4c1ab155eac9004b37c6985e16481f54b3674dc6836c8c1444bab88'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
