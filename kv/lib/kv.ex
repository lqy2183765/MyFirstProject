defmodule KV do
  @moduledoc """
  Documentation for KV.
  """

  @doc """
  Hello world.

  ## Examples

      iex> KV.hello
      :world

  """
  def hello do
    :world
  end

  def main1 do
    list = [{:a, 1}];
    list ++ {:c, 2};
    IO.puts list[:a];
    IO.puts list[:c];
  end

  def main2 do
    map = %{:a => 1, :b =>2, 3 => 5}
    %{map | :a => 2}
    IO.puts map[3]
    IO.puts map[:a]
    IO.puts map.a
  end
end
