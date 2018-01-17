defmodule Ping do
    def start do
        loop()
    end

    def loop do
        receive do
            {:pong, from} ->
                IO.puts "ping ->"
                :timer.sleep 500
                IO.puts "awake"
                send from, {:ping, self()}
                loop()
            {:ping ,from} ->
                IO.puts "        <= pong"
                :timer.sleep 500
                IO.puts "awake"
                send from, {:pong, self()}
                loop()
        end
    end
end

defmodule TestPing dof
    def start do
        ping = spawn_link Ping, :start, []
        pong = spawn_link Ping, :start, []
        send ping, [:pong, pong]
    end
end