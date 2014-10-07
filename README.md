Blog Eye: A platform for sharing blogs
=======

[![Build Status](http://img.shields.io/travis/agilejzl/blog-eye.svg)][travis]
[![Code Climate](http://img.shields.io/codeclimate/github/agilejzl/blog-eye.svg)][codeclimate]
[![Coverage Status](http://img.shields.io/coveralls/agilejzl/blog-eye.svg)][coveralls]
[![Security](https://hakiri.io/github/agilejzl/blog-eye/master.svg)][security]

[travis]: http://travis-ci.org/agilejzl/blog-eye
[codeclimate]: https://codeclimate.com/github/agilejzl/blog-eye
[coveralls]: https://coveralls.io/r/agilejzl/blog-eye
[security]: https://hakiri.io/github/agilejzl/blog-eye/master

Blog Eye, you know, a platform for sharing blogs. Site url: [http://www.blog-eye.com/](http://www.blog-eye.com/)

## How to Install

Make sure mysql already started.
```bash
git clone git@github.com:agilejzl/blog-eye.git
cd blog-eye
ruby setup.rb # A ruby script to make project RTF

# Then change config at database.yml and settings.yml
RAILS_ENV=development rails s
# start sidekiq for async sending email and uploading photo
bundle exec sidekiq -e development
```

## Gemfile Source

By default bundler installs gems using the ruby.taobao.org source, if you'd rather use the official one, set environment variable `USE_OFFICIAL_GEM_SOURCE`:

```bash
USE_OFFICIAL_GEM_SOURCE=1
```

## How to Test

We use rspec & capybara to test.
```bash
# Create db, load schema, and initialize with seed
RAILS_ENV=test rake db:setup

RAILS_ENV=test rails s
bundle exec rspec -fd # Run all test examples in ./spec folder

# Or test specified directories
bundle exec rspec -fd ./spec/features # Make sure already installed firefox
```

## Documents

```bash
# For online: http://rubydoc.info/github/agilejzl/blog-eye
yard server # For local, generate documents, then visit http://localhost:8808/
```

## Contributors

* [Contributors](https://github.com/agilejzl/blog-eye/contributors)

## Thanks

* [Twitter Bootstrap](http://getbootstrap.com/)

## License

Copyright (c) 2014 Blog Eye

Released under the MIT license:

* [www.opensource.org/licenses/MIT](http://www.opensource.org/licenses/MIT)

