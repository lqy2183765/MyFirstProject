defmodule CounterTest do
  use ExUnit.Case
  doctest Counter

  test "greets the world" do
    # {:ok, pid} = Counter_List.start ["a", "b"]
    # Counter_List.add ["c"]
    {:ok, pid2} = Counter_Map2.start %{:a => 1, :b => 2}
    value = Counter_Map2.get_value pid2, :a
    # assert Counter_List.get_value(pid) == ["a", "b", "c"]
    assert value == 1
    IO.puts value
  end

  test "this is a example" do
    # {:ok, pid} = Counter_List.start ["a", "b"]
    # Counter_List.add ["c"]
    {:ok, pid2} = Counter_Map2.start %{:a => 1, :b => 2}
    value = Counter_Map2.get_value pid2, :b
    # assert Counter_List.get_value(pid) == ["a", "b", "c"]
    assert value == 1
    IO.puts value
  end
end
