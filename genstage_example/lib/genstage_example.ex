defmodule GenstageExample.Producer do
  use GenStage
  def start_link(number) do
    GenStage.start_link(__MODULE__, number, name: __MODULE__)
  end

  def init(counter) do
    {:producer, counter}
  end

  def handle_demand(demand, counter) when demand > 0 do
    # If the counter is 3 and we ask for 2 items, we will
    # emit the items 3 and 4, and set the state to 5.
    events = Enum.to_list(counter..counter+demand-1)
    {:noreply, events, counter + demand}
  end
end

defmodule GenstageExample.P2C do
  use GenStage
  def start_link do
    GenStage.start_link(__MODULE__, :state_doesnt_matter, name: __MODULE__)
  end

  def init(number) do
    {:producer_consumer, number, subscribe_to: [GenstageExample.Producer]}
  end

  def handle_events(events, _from, number) do
    events = Enum.map(events, 
      fn x ->
        x * 2 
      end)
    {:noreply, events, number}
  end
end

defmodule GenstageExample.Consumer do
  use GenStage

  def start_link do
    GenStage.start_link(__MODULE__, :state_doesnt_matter, name: __MODULE__)
  end
  def init(state) do
    {:consumer, state, subscribe_to: [GenstageExample.P2C]}
  end
  def handle_events(events, _from, state) do
    for event <- events do
      # IO.inspect({self(), event, state})
    end
    {:noreply, [], state}
  end

end

defmodule GenstageExample do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false
  
    children = [
      worker(GenstageExample.Producer, [0]),
      worker(GenstageExample.P2C, []),
      worker(GenstageExample.Consumer, [], id: 1),
      #worker(GenstageExample.Consumer, [], id: 2)
    ]
  
    opts = [strategy: :one_for_one, name: GenstageExample.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
