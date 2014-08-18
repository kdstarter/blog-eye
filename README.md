Ruby Eye: A platform for sharing blog
=======

[![Build Status](http://img.shields.io/travis/agilejzl/ruby-eye.svg)][travis]
[![Dependency Status](http://img.shields.io/gemnasium/agilejzl/ruby-eye.svg)][gemnasium]
[![Code Climate](http://img.shields.io/codeclimate/github/agilejzl/ruby-eye.svg)][codeclimate]
[![Coverage Status](http://img.shields.io/coveralls/agilejzl/ruby-eye.svg)][coveralls]
[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/agilejzl/ruby-eye/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

[travis]: http://travis-ci.org/agilejzl/ruby-eye
[gemnasium]: https://gemnasium.com/agilejzl/ruby-eye
[codeclimate]: https://codeclimate.com/github/agilejzl/ruby-eye
[coveralls]: https://coveralls.io/r/agilejzl/ruby-eye

Ruby Eye, you know, a platform for sharing blog.
Site url: [http://121.40.94.192/](http://121.40.94.192/)

## How to Install

Make sure mysql already started.
```bash
git clone git@github.com:agilejzl/ruby-eye.git
cd ruby-eye
# A ruby script to RTF
ruby setup.rb
rails s
```

## How to Test

We use rspec to test.
```bash
bundle exec rake rspec
```
