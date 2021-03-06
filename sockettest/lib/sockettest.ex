defmodule Sockettest do
  use Application

  @doc false
  def start(_type, _args) do
    import Supervisor.Spec

    children = [
      supervisor(Task.Supervisor, [[name: Sockettest.TaskSupervisor]]),
      worker(Task, [Sockettest, :accpet, [4040]])
    ]

    opts = [strategy: :one_for_one, name: Sockettest.Supervisor]
    Supervisor.start_link children, opts
  end

  @doc """
  Starts accepting connections on the given `port`.
  """
  def accept(port) do
    {:ok, socket} = :gen_tcp.listen port, [:binary, packet: :line, active: false]
    IO.puts "Accepting connections on port #{port}"
    loop_acceptor(socket)
  end

  defp loop_acceptor(socket) do
    {:ok, client} = :gen_tcp.accept socket
    Task.Supervisor.start_child Sockettest.TaskSupervisor, fn -> serve(client) end
    loop_acceptor socket
  end

  defp serve(client) do
    client
    |> read_line()
    |> write_line(client)
    
    serve client
  end

  defp read_line(socket) do
    {:ok, data} = :gen_tcp.recv socket, 0
    data
  end

  defp write_line(line, socket) do
    :gen_tcp.send socket, line
  end

end

defmodule KVServer.Command do
  @doc ~S"""
  Parses the given 'line' into a command

  ## Examples

    iex>KVServer.Command.parse "CREATE shoppimg\r\n"
    {:ok. {:create, "shopping"}}
  """
  def parse(line) do
    :not_implemented
  end
end