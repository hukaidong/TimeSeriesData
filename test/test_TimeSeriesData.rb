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

  it "works with empty array" do
    data_ary = []
    tsd = data_ary.to_timeseries
    assert_nil(tsd.interpolate(0))
  end

  it "works with one element array" do
    data_ary = [[0, 0]]
    tsd = data_ary.to_timeseries
    assert_in_epsilon(0, tsd.interpolate(0))
    assert_nil(tsd.interpolate(-1))
    assert_in_epsilon(0, tsd.interpolate(-1, extrapolate: true))
  end

  it "works with two element array" do
    data_ary = [[0, 0], [1, 1]]
    tsd = data_ary.to_timeseries
    assert_in_epsilon(0.5, tsd.interpolate(0.5))
    assert_nil(tsd.interpolate(-1))
    assert_in_epsilon(0, tsd.interpolate(-1, extrapolate: true))
  end
end
