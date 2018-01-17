defmodule Upcaser do
  @moduledoc """
  Documentation for Upcaser.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Upcaser.hello
      :world

  """
  def start do
    pid = spawn(Upcaser, :loop, [])
    {:ok, pid}
  end

  def loop do
    IO.puts "Upcaser loop is beginning"
    receive do
      {from, ref, {:upcase, str}} ->
        IO.puts "Upcaser loop is Receiving"
        send from, {:ok, ref, String.upcase(str)}
    end
    loop
  end

  def upcase(server_pid, str) do
    ref = make_ref()
    send server_pid, {self(), ref, {:upcase, str}}
    receive do
      {:ok, ^ref, str} -> 
        IO.puts "res is #{str}"
        {:ok, str}
    end
  end
end
