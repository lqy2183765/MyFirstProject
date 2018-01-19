defmodule GenserverTest do
  use ExUnit.Case
  doctest SimpleQueue

  test "greets the world" do
    {:ok, pid} = SimpleQueue.start_link([1, 2, 3])
    IO.puts SimpleQueue.dequeue pid
    IO.puts SimpleQueue.queue pid
    IO.puts SimpleQueue.addqueue pid, 5
    IO.puts SimpleQueue.queue pid
  end
end
