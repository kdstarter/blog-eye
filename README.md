Blog Eye: A platform for sharing blogs
=======

[![Dependency Status](http://img.shields.io/gemnasium/agilejzl/blog-eye.svg)][gemnasium]
[![Code Climate](http://img.shields.io/codeclimate/github/agilejzl/blog-eye.svg)][codeclimate]
[![Coverage Status](http://img.shields.io/coveralls/agilejzl/blog-eye.svg)][coveralls]
[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/agilejzl/blog-eye/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

[gemnasium]: https://gemnasium.com/agilejzl/blog-eye
[codeclimate]: https://codeclimate.com/github/agilejzl/blog-eye
[coveralls]: https://coveralls.io/r/agilejzl/blog-eye

Blog Eye, you know, a platform for sharing blog.
Site url: [http://www.blog-eye.com/](http://121.40.94.192/)

## How to Install

Make sure mysql already started.
```bash
git clone git@github.com:agilejzl/blog-eye.git
cd blog-eye
# A ruby script to RTF
ruby setup.rb
rails s
```

## How to Test

We use rspec & capybara to test.
```bash
RAILS_ENV=test rails s
# Make sure already installed firefox
bundle exec rake rspec
```
