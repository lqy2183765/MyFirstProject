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

defmodule FileTest do
    def write(content) do
        filePath = "hello"
        {:ok, file} = File.open(filePath, [:write])
        try do
            IO.binwrite file, content
        after
            File.close file
        end
    end

    def read do
        filePath = "hello"
        File.read filePath
    end
end

defmodule Attributies do
    @userId 12306
    @userName "你好啊"
    
    def output do
        IO.puts "#{@userId}-#{@userName}"
    end

end

defmodule Structs do
    def change do
        map = %{a: 1, b: 2}
        %{map | a: 3}
    end
end

defmodule User do
    defstruct name: "lqy", age: 28
end

defmodule UserTest do
    def structstest do
        %User{age: 29}
    end
    def createstruct do
        user1 = %User{name: "lqy1", age: 2}
        user2 = %User{name: "lqy2", age: 3}
        user1 = Map.put(user1, :name, "heihei")
        IO.puts user1.name
        IO.puts user2.name
        x = 1
        x = x + 2
        IO.puts x
    end
end


defprotocol Blank do
    def blank?(data)
end

defimpl Blank, for: List do
    def blank?([]), do: true
    def blank?(_), do: false
end

defmodule Comp do
    def sum(a, b) do
        for t <- 1..100,
            s <- 1..100,
            t == a + 1,
            s == b - 2,
            do: {t, s}
    end
end

defmodule Rtn do
    @spec add(number, number) :: String
    def add(x, y) do
        sum = x + y
        "result is #{sum}"
    end
end

defmodule Parser do
    @callback parse(String) :: any
    @callback extensions() :: [String.t]
end

defmodule Seq do
    @callback getSeq(number) :: Integer
end

defmodule JSONParser do
    @behaviour Parser
    @behaviour Seq

    def parse(str), do: "this is #{str}"
    def extensions, do: ["json"]
    def getSeq(num) do
        x = num + 2;
        x * 2
    end
end

EnumTest.incrMap(%{1 => 2, 3 => 4})