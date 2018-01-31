defmodule SockettestTest do
  use ExUnit.Case
  doctest Sockettest

  test "greets the world" do
    assert Sockettest.hello() == :world
  end
end
