defmodule Math do
    def sum(a, b) do
        a + b
    end

    def zero?(0) do
        true
    end
    def zero?(x) when is_integer(x) do
        false
    end
    def zero?(x) when is_bitstring(x), do: x
end

defmodule ListMath do
    def sum_list([head | tail], accumulator) do
        sum_list(tail, accumulator + head)
    end

    def sum_list([], accumulator) do
        accumulator
    end

end

defmodule EnumTest do
    def incrList(list) when is_list(list) do
        Enum.map(list, fn x -> x + 1 end)
    end
    def incrMap(map) when is_map(map) do
        Enum.map(map, fn {k, v} -> IO.puts "#{k}-#{v}" end)
    end
end

defmodule Thread do
    def newThread do
        spawn fn ->
            IO.puts "hello"
        end
    end
    def newReceive do
        receive do
            {:hello, msg} -> IO.puts "receive msg:#{msg}"
        after
            1000_000 -> "nothing after 1s"
        end
    end
    def sendMsg do
        parent = self()
        spawn fn -> send(parent, {:hello, "this is a msg"}) end
    end
end

defmodule KV do
    def start_link do
        Task.start_link(fn -> loop(%{}) end)
    end

    defp loop(map) do
        receive do
            {:get, key, caller} ->
                send caller, Map.get(map, key)
                loop(map)
            {:put, key , value} ->
                loop(Map.put(map, key, value))
        end
    end

end

EnumTest.incrMap(%{1 => 2, 3 => 4})