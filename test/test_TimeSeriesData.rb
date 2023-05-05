# frozen_string_literal: true

require "test_helper"


describe TimeSeriesData do
  it "does what README.md says" do
    data_ary = Array.new(10) { |i| [i, Math.sin(i) + i] }
    tsd = data_ary.to_timeseries
    assert_in_epsilon(0.9207354924039483, tsd.interpolate(0.5))
    assert_nil(tsd.interpolate(-1))
    assert_in_epsilon(0.0, tsd.interpolate(-1, extrapolate: true))
  end
end
