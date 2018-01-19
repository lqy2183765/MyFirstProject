defmodule Etsserver do
  def init do
    table = :ets.new :server1, [:named_table]
    :ets.insert table, {"foo", 1}
  end

  def look_up do
    :ets.lookup: :server1, "foo"
  end
end
