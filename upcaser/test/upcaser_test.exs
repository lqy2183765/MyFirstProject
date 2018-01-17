defmodule UpcaserTest do
  use ExUnit.Case
  doctest Upcaser

  test "greets the world" do
    {:ok, upcaser_pid} = Upcaser.start
    assert {:ok, "FOO"} = Upcaser.upcase(upcaser_pid, "foo")
  end
end
