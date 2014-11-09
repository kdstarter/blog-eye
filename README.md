Blog Eye: A platform for sharing blogs
=======

[![Build Status](http://img.shields.io/travis/agilejzl/blog-eye.svg)][travis]
[![Code Climate](http://img.shields.io/codeclimate/github/agilejzl/blog-eye.svg)][codeclimate]
[![Coverage Status](http://img.shields.io/coveralls/agilejzl/blog-eye.svg)][coveralls]
[![Inline docs](http://inch-ci.org/github/agilejzl/blog-eye.svg)][inch]

[travis]: http://travis-ci.org/agilejzl/blog-eye
[codeclimate]: https://codeclimate.com/github/agilejzl/blog-eye
[coveralls]: https://coveralls.io/r/agilejzl/blog-eye
[inch]: http://inch-ci.org/github/agilejzl/blog-eye

Blog Eye, you know, a platform for sharing blogs. Site url: [http://www.blog-eye.com/](http://www.blog-eye.com/)

## Requirements  

* Redis 2.2 +
* MySQL 5.5 +
* Ruby 2.0.0 +
* Rails 4.0.0 +
* ImageMagick 6.5 +

## Install

Make sure mysql already started.  
```bash  
git clone git@github.com:agilejzl/blog-eye.git  

cd blog-eye && ruby setup.rb # Make project RTF  
```

Then change config at database.yml and settings.yml  
```bash  
RAILS_ENV=development rails s  

bundle exec sidekiq -e development # for async sending email and uploading  
```  

## Deploy  

```bash  
cap production deploy  
```  

## Gemfile  

By default bundler installs gems using the ruby.taobao.org source,   
if you'd rather use the official one, set environment variable `USE_OFFICIAL_GEM_SOURCE`:

```bash  
USE_OFFICIAL_GEM_SOURCE=1  
```  

## Test

We use rspec and capybara to test.  
```bash  
RAILS_ENV=test rake db:setup  

RAILS_ENV=test rails s  
```  

Make sure already installed firefox.  
```bash  
bundle exec rspec -fd  

bundle exec rspec -fd ./spec/features # Run only features test  
```  

## Documents

For online doc: [http://rubydoc.info/github/agilejzl/blog-eye](http://rubydoc.info/github/agilejzl/blog-eye)   
```bash  
yard server --reload # For local, visit http://localhost:8808/  
```  

## Contributors

* [Contributors](https://github.com/agilejzl/blog-eye/contributors)

## Thanks

* [Font Awesome](http://fontawesome.io/)
* [Twitter Bootstrap](http://getbootstrap.com/)
* [Qiniu (七牛云存储)](http://www.qiniu.com/)

## License

Copyright (c) 2014 Blog Eye

Released under the MIT license:

* [www.opensource.org/licenses/MIT](http://www.opensource.org/licenses/MIT)

