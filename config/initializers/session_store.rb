# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_domaim_session',
  :secret      => 'f3b3f29560071b8516b801ac94e88442664de483369bf0ebc2838ce43ba508ea227b7bb75ba1bfbd5b2baaed33abf3041287293bc47cd7855cb1b9295cf34b78'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
