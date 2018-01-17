defmodule Counter do
  def start(initial_value) do
    Agent.start(fn -> initial_value end)
  end

  def get_value(pid) do
    Agent.get pid, fn(x) -> {:ok, x} end
  end

  def incr(pid) do
    Agent.update pid, fn(x) -> x + 1 end
  end

  def decr(pid) do
    Agent.update pid, fn(x) -> x - 1 end
  end
end

defmodule Counter_List do
  def start(list) do
    Agent.start(fn -> list end)
  end

  def get_value(pid) do
    Agent.get pid, fn(list) -> list end
  end

  def add(pid, str) do
    Agent.update pid, fn(list) -> [str | list] end
  end
end

defmodule Counter_Map do
  def start(map) do
    Agent.start(fn -> map end)
  end
  def get_value(pid, key) do
    Agent.get pid, fn(map) -> Map.get map, key end
  end
end

defmodule Counter_Map2 do
  def start(map) do
    Agent.start(fn -> map end)
  end
  def get_value(pid, key) do
    Agent.get pid, &Map.get(&1, key)
  end
end
