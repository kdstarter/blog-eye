# Be sure to restart your server when you modify this file.

# Rails.application.config.session_store :cookie_store, key: '_blog-eye_session'
BlogEye::Application.config.session_store :redis_store, key: '_blog-eye_session', namespace: '_im_session'
