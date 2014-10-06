# coding: utf-8
if ENV['USE_OFFICIAL_GEM_SOURCE']
  source 'https://rubygems.org'
else
  source 'https://ruby.taobao.org'
end

gem 'rails', '4.1.5'
gem 'mysql2', '0.3.16'
gem 'coffee-rails', '4.0.0'
gem 'jquery-rails', '3.1.1'

gem 'sass-rails', '4.0.3'
gem 'bootstrap-sass', '3.2.0.1'
gem 'font-awesome-sass-rails', '3.0.2.2'
gem 'yui-compressor', '0.12.0', require: false # 预编译最大化压缩assets

gem 'devise', '3.3.0' # 用户session管理
gem 'devise-i18n', '0.11.0' # devise国际化支持
gem 'devise-async', '0.9.0' # 异步处理devise邮件

gem 'friendly_id', '5.0.4' # 更友好的id
gem 'simple_form', '3.1.0.rc2' # 页面表单
gem 'paranoia', '2.0.2' # 软删除
gem 'browser', '0.6.0' # 浏览器版本检测

gem 'puma', '2.9.1' # 多线程支持
gem 'bugsnag', '2.4.1' # 实时错误监测通知
gem 'whenever', '0.9.2', require: false # 定时任务
gem 'nokogiri', '1.6.3.1', require: false # 抓取页面并分析

gem 'rails-i18n', '4.0.2' # rails国际化支持
gem 'rails_config', '0.4.2' # 从yml文件加载配置
gem 'kaminari', '0.16.1' # 查询分页支持
gem 'activeadmin', '1.0.0.pre', github: 'gregbell/active_admin' # 系统后台管理
gem 'simple_captcha', '0.1.6', github: 'galetahub/simple-captcha' # 图形验证码

gem 'ckeditor', '4.0.11' # html编辑器
gem 'non-stupid-digest-assets', '1.0.4' # ckeditor预编译支持
gem 'carrierwave', '0.10.0' # 文件上传
gem 'qiniu-rs', '3.4.10' # 上传文件到七牛
gem 'mini_magick', '3.8.0' # 图片切割
gem 'carrierwave-qiniu', '0.1.3' # carrierwave与qiniu集成

gem 'daemons', '1.1.9' # 后台进程支持
gem 'sidekiq', '3.2.5' # 延时任务支持
gem 'sinatra', '1.4.5', require: false # 使用sidekiq自带的监控页面
gem 'redis-rails', '4.0.0' # rails中redis集成
gem 'redis-namespace', '1.4.1' # redis namespace支持

group :development, :test do
  gem 'rspec-rails', '3.0.0'
  gem 'rspec-expectations', '3.0.0'
  gem 'rspec-example_steps', '3.0.2', require: false
  
  gem 'capybara', '2.4.3' # 页面测试
  gem 'database_cleaner', '1.3.0' # 自动清除测试数据
  gem 'factory_girl_rails', '4.4.1' # rspec数据工厂
  gem 'watir-webdriver', '0.6.11', require: false # 驱动浏览器做features测试
  
  gem 'byebug', '3.2.0' # 调试工具
  gem 'better_errors', '1.1.0' # 更友好的错误显示页
  gem 'binding_of_caller', '0.7.2' # 在错误页进行调试

  gem 'hirb', '0.7.2' # rails c 表格化数据显示
  gem 'rails_best_practices', '1.15.4' # 最佳rails实践风格
  gem 'simplecov', '0.9.0', require: false # 测试覆盖率并生成html报告

  gem 'highline', '1.6.21' # capistrano deploy时不回显密码
  gem 'capistrano', '3.1.0' # 自动化部署支持
  gem 'capistrano-rvm', '0.1.1'
  gem 'capistrano-rails', '1.1.0'
  gem 'capistrano-bundler', '1.1.3'
end

