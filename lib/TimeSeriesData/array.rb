# frozen_string_literal: true

module TimeSeriesData
  class Array < ::Array
    def initialize(*args)
      args[0].sort_by!(&:first)
      super(*args)
    end

    def time_range
      (first[0]..last[0])
    end

    def interp_at(time, extrapolate: false)
      return nil if empty?

      unless time_range.cover?(time)
        return nil unless extrapolate
        return first[1] if time < first[0]
        return last[1] if time > last[0]
      end

      return first[1] if length == 1

      index = bsearch_index {|x| x[0] >= time }

      # interpolate between index-1 and index
      x0, y0 = self[index - 1]
      x1, y1 = self[index]
      y0 + (y1 - y0) * (time - x0) / (x1 - x0)
    end

    def inspect
      "#<TimeSeriesData::Array:#{object_id} range:#{time_range.inspect}>"
    end

    alias interpolate interp_at
  end
end
