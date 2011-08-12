# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_RailsApplication1_session',
  :secret      => '5f64d9f37de2180fc8b840e819bf1518fb26a895aa20f64d9a59adfaba59a9be20e9590e85cbfa63d65c508e7c6f6176cda075c3a3b48ed2bd89c4932c3c0b2b'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
