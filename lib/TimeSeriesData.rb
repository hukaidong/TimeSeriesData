# frozen_string_literal: true

require_relative "TimeSeriesData/version"

module TimeSeriesData
  class Error < StandardError; end
  # Your code goes here...
  class Array < ::Array
    def initialize(*args)
      args[0].sort_by!(&:first)
      super(*args)
    end

    def time_range
      [self.first[0], self.last[0]]
    end

    def interp_at(time, extrapolate: false)
      if extrapolate
        return self.first[1] if time < self.first[0]
        return self.last[1] if time > self.last[0]
      else
        return nil unless time.between?(*self.time_range)
      end

      index = bsearch_index {|x| x[0] >= time }

      # interpolate between index-1 and index
      x0, y0 = self[index-1]
      x1, y1 = self[index]
      y0 + (y1 - y0) * (time - x0) / (x1 - x0)
    end
  end
end

class Array
  def to_timeseries
    TimeSeriesData::Array.new(self)
  end
end