defmodule SimpleQueue do
  use GenServer

  #Server
  def init(state) do
    {:ok, state}
  end

  def handle_call(:dequeue, _from, [value | state]) do
    {:reply, value, state}
  end

  def handle_call(:queue, _from, state) do
    {:reply, state, state}
  end

  def handle_call({:addqueue, str}, _from, state) do
    new_state = [str | state]
    {:reply, new_state, new_state}
  end

  #Client
  def start_link(state) do
    GenServer.start_link(__MODULE__, state, name: :test)
  end

  def queue(server) do
    GenServer.call server, :queue
  end
  def dequeue(server) do
    GenServer.call server, :dequeue
  end
  def addqueue(server, param) do
    GenServer.call server, {:addqueue, param}
  end
end

defmodule My.Supervisor do
  use Supervisor

  def start_link do
    
  end


end
