# TimeSeriesData

A tool used to interpolate time series data.

## Installation

By default, this gem is not available on RubyGems. To install it, you must clone 
this repository and run `bundle install` to install the dependencies. Then, run 
`bundle exec rake install` to install the gem on your system.

```bash
$ git clone https://github.com/hukaidong/TimeSeriesData
$ cd TimeSeriesData
$ bundle install
$ bundle exec rake install
```

If you are using bundler's Gemfile, you can add this line to your application's Gemfile:

```ruby
gem 'TimeSeriesData', github: 'hukaidong/TimeSeriesData'
```

## Usage

Assume you have an array of time series data.
    
```ruby
    data_ary = Array.new(10) { |i| [i, Math.sin(i) + i] }
```

To convert this array to a TimeSeriesData object, you can use the following code:

```ruby
    require 'TimeSeriesData'

    tsd = data_ary.to_timeseries  # => #<TimeSeriesData::Array:1100 range:[0, 9]>
```

To interpolate the data, you can use the following code:

```ruby
    tsd.interpolate(0.5)  # => 0.9207354924039483
    tsd.interpolate(-1)  # => nil  # Out of range returns nil by default
    tsd.interpolate(-1, extrapolate: true)  # => 0.0  # with extrapolation, out of range returns data[0] or data[-1]
```

## Development

