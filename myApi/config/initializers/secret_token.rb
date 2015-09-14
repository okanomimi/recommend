# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
MyApi::Application.config.secret_key_base = 'b34ab99b2e15ac29066fbeacc35dc99eef97896495c8ee0f5add6504e49c3e183a5f7e2d464e75c315be1f6b7004112e83d64aa5e0728ad29d187088845bd423'
