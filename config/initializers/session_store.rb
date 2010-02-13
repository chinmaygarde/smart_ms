# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_smartms_web_session',
  :secret      => 'afe48b348ceb5fb70bfc56e1bfb88deeebf889c79ee8ed3a922190169dd6b81c5642e40f061ee903c2bb339e9fc7e69695dce4656454a0b303e2f13653488853'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
