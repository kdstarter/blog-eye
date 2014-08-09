
Rails.application.config.assets.precompile += %w(
  frontend/application.css frontend/blog_home.css
)

Rails.application.config.assets.precompile += %w(
  frontend/application.js frontend/blog_home.js
)