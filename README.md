Blog Eye: A platform for sharing blogs
=======

[![Code Climate](http://img.shields.io/codeclimate/github/agilejzl/blog-eye.svg)][codeclimate]
[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/agilejzl/blog-eye/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

[codeclimate]: https://codeclimate.com/github/agilejzl/blog-eye

Blog Eye, you know, a platform for sharing blog.
Site url: [http://www.blog-eye.com/](http://www.blog-eye.com/)

## How to Install

Make sure mysql already started.
```bash
git clone git@github.com:agilejzl/blog-eye.git
cd blog-eye
ruby setup.rb # A ruby script to make project RTF

# Then change config at database.yml and settings.yml
RAILS_ENV=development rails s
# start delayed_job for async sending email and uploading photo
RAILS_ENV=development bin/delayed_job start
```

## How to Test

We use rspec & capybara to test.
```bash
RAILS_ENV=test rails s
# Make sure already installed firefox
bundle exec rspec -fd

# Or test specified directories
bundle exec rspec -fd ./spec/features
```
