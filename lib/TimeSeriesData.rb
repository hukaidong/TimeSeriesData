# frozen_string_literal: true

require_relative "TimeSeriesData/version"
require_relative "TimeSeriesData/array"

class Array
  def to_timeseries
    TimeSeriesData::Array.new(self)
  end
end