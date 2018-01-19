defmodule EtsserverTest do
  use ExUnit.Case
  doctest Etsserver

  test "greets the world" do
    assert Etsserver.hello() == :world
  end
end
