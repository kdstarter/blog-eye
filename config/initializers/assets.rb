
Rails.application.config.assets.precompile += %w( 
  frontend/home.css frontend/blogger.css
  admin/session.css admin/home.css 
)

Rails.application.config.assets.precompile += %w( 
  shared/ie_support.js
  frontend/home.js frontend/blogger.js
  admin/session.js admin/home.js
)

Rails.application.config.assets.precompile += Ckeditor.assets
