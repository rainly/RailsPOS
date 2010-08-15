# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_pos_login_session',
  :secret      => 'b7aa6c96567688dd14ee93f4cd488fcdbc7f51a17b4e6c292c27bba66d3c7fa2d9fa4b0c9fb6e6f03754e54fd6a209be8049452e017fb0cc6b52b115d9d55863'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
