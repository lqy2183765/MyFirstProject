defmodule RpnTest do
  use ExUnit.Case
  doctest Rpn

  test "wikipedia example" do
    {:ok, pid} = Rpn.start
    Rpn.push(pid, 5)
    Rpn.push(pid, 1)
    Rpn.push(pid, 2)
    Rpn.push(pid, :+)
    Rpn.push(pid, 4)
    Rpn.push(pid, :x)
    Rpn.push(pid, :+)
    Rpn.push(pid, 3)
    Rpn.push(pid, :-)
    list = Rpn.peek(pid)
    [head | tail] = list
    assert list == [14]
    IO.puts head
  end
end
