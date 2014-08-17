
Rails.application.config.assets.precompile += %w(
  frontend/home.css frontend/blog_home.css
  admin/sessions.css admin/home.css
)

Rails.application.config.assets.precompile += %w(
  frontend/home.js frontend/blog_home.js
  admin/sessions.js admin/home.js
)
