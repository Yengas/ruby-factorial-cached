ruby-factorial-cached
=====================

ruby-factorial-cached is a gem which aims to fasten your consecutively made factorial operations with caching. This gem was half-way done because of a little Project Euler adventure of mine. Please make any pull requests that you think will fasten the operations and i will check it out and update the gem on rubygems asap.

Usage
=====

### Installation

```
gem install factorial-cached
```

### Code

```ruby
require 'factorial-cached'

5.factorial # => 120, Caches 5 factorial
8.factorial(:cache_all) # => 5! * 6 * 7 * 8, Caches 6..8 factorial
7.factorial # => 8! / 8

Factorial::extract(17, 16) # => 16 * 16!, Caches both 16 and 17 for further usage.
Factorial::closest(18) # => 17, Gets closest cached factorial to the given numumber.

```

License
=======

MIT: [External Link to License](http://opensource.org/licenses/MIT)
