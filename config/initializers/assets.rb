
Rails.application.config.assets.precompile += Ckeditor.assets

Rails.application.config.assets.precompile += %w(
  frontend/home.css frontend/blogger.css
  admin/sessions.css admin/home.css
)

Rails.application.config.assets.precompile += %w(
  frontend/home.js frontend/blogger.js
  admin/sessions.js admin/home.js
)
