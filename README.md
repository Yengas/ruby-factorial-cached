ruby-factorial-cached
=====================

ruby-factorial-cached is a gem which aims to fasten your consecutively made factorial operations with caching. This gem was half-way done because of a little Project Euler adventure of mine. Please make any pull requests that you think will fasten the operations and i will check it out and update the gem on rubygems asap.

Usage
=====

### Installation

```
gem install factorial-cached
```

### Options

You can pass some parameters to factorial method to your needs. Above are the options and their default values.

```ruby

 # Caching

:cache_none # Doesn't caches any calculated factorial.
:cache_all # Caches all the possible invocation/iteration results. This option is not recommended if you will work with high numbers.
:cache # Caches only the given numbers results. (DEFAULT)

 # Algorithm

:iterative # Iterative implementation of the Factorial Algorithm. Good if you will calculate high numbers. (Default after and at 100.000)
:recursive # Recursive implementation of the Factorial Algorithm. Good if you want speed on low numbers. (Default below 100.000)

 # Closest

:value # Returns value of the closest factorial.
:factorial # Returns closest cached factorial.

```

### Code

```ruby
require 'factorial-cached'

5.factorial # => 120 - Caches 5 factorial only.
8.factorial(:cache_all) #=> 40320 - Caches through 6..8 factorial.
7.factorial #=> 5040 - Returns by Dividing cached 8! / 8

Factorial::factorial(5, :iterative, :cache_all) #=> Same deal as the Integer#factorial

Factorial::closest(5) #=> 5 - Returns closest cached factorial by the given number.
Factorial::closest(5, :value) #=> 120 - Returns closest cached factorial's value by the given number.

```

License
=======

MIT: [External Link to License](http://opensource.org/licenses/MIT)
