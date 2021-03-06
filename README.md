# contracts.ruby
[![Build Status](https://travis-ci.org/ddd-ruby/contracts.ruby.png)](https://travis-ci.org/ddd-ruby/contracts.ruby)
[![Gem Version](https://badge.fury.io/rb/contracts-lite.png)](http://badge.fury.io/rb/contracts-lite)
[![Code Climate](https://codeclimate.com/github/ddd-ruby/contracts.ruby/badges/gpa.svg)](https://codeclimate.com/github/ddd-ruby/contracts.ruby)
[![codecov](https://codecov.io/gh/ddd-ruby/contracts.ruby/branch/master/graph/badge.svg)](https://codecov.io/gh/ddd-ruby/contracts.ruby)
[![Dependency Status](https://gemnasium.com/ddd-ruby/contracts.ruby.png)](https://gemnasium.com/ddd-ruby/contracts.ruby)


## Fork of https://github.com/egonSchiele/contracts.ruby
Until this issue https://github.com/egonSchiele/contracts.ruby/pull/246 is resolved, we decided to mainain our own fork of contracts named `contracts-lite`.

<hr>

Contracts let you clearly – even beautifully – express how your code behaves, and free you from writing tons of boilerplate, defensive code.

You can think of contracts as `assert` on steroids.

## Installation

    gem install contracts-lite

## Hello World

A contract is one line of code that you write above a method definition. It validates the arguments to the method, and validates the return value of the method.

Here is a simple contract:

```ruby
  Contract Num => Num
  def double(x)
```

This says that double expects a number and returns a number. Here's the full code:

```ruby
require 'contracts'

class Example
  include Contracts::Core
  include Contracts::Builtin

  Contract Num => Num
  def double(x)
    x * 2
  end
end

puts Example.new.double("oops")
```

Save this in a file and run it. Notice we are calling `double` with `"oops"`, which is not a number. The contract fails with a detailed error message:

```
ParamContractError: Contract violation for argument 1 of 1:
        Expected: Num,
        Actual: "oops"
        Value guarded in: Example::double
        With Contract: Num => Num
        At: main.rb:8
        ...stack trace...
```

Instead of throwing an exception, you could log it, print a clean error message for your user...whatever you want. contracts.ruby is here to help you handle bugs better, not to get in your way.

## Tutorial

Check out [this awesome tutorial](http://egonschiele.github.com/contracts.ruby).

## Use Cases

Check out [this screencast](https://vimeo.com/85883356).

## Development

To get started do the following:

1. Install required gems for development

  `bundle install`

2. Run our test suite

  `bundle exec rspec`

## Performance

Using contracts.ruby results in very little slowdown. Check out [this blog post](http://adit.io/posts/2013-03-04-How-I-Made-My-Ruby-Project-10x-Faster.html#seconds-6) for more info.

**Q.** What Rubies can I use this with?

**A.** It's been tested with `1.9.2`, `1.9.3`, `2.0.0`, `2.1`, `2.2`, and `jruby` (1.9 mode).

If you're using the library, please [let me know](https://github.com/egonSchiele) what project you're using it on :)

## Testimonials

> Contracts literally saves us hours of pain at Snowplow every day

Alexander Dean, creator of [Snowplow](https://github.com/snowplow/snowplow)

> Contracts caught a bug that saved us several hundred dollars. It took less than 30 seconds to add the contract.

Michael Tomer

## Credits

Inspired by [contracts.coffee](http://disnetdev.com/contracts.coffee/).

Copyright 2012-2015 [Aditya Bhargava](http://adit.io).
Major improvements by [Alexey Fedorov](https://github.com/waterlink).

BSD Licensed.

