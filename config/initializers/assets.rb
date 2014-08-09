
Rails.application.config.assets.precompile += %w(
  frontend/home.css frontend/blog_home.css
  admin/session.css admin/home.css
)

Rails.application.config.assets.precompile += %w(
  frontend/home.js frontend/blog_home.js
  admin/session.js admin/home.js
)