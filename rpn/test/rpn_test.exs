defmodule RpnTest do
  use ExUnit.Case
  doctest Rpn

  test "subtracting" do
    {:ok, pid} = Rpn.start
    Rpn.push(pid, 5)
    Rpn.push(pid, 1)
    Rpn.push(pid, :-)
    assert Rpn.peek(pid) == [4]
  end
end
