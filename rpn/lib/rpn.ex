defmodule Rpn do
  def start do
    Agent.start(fn -> [] end)
  end

  def push(pid, operation) do
    Agent.update(pid, fn(list) -> [operation | list] end)
  end

  def peek(pid) do
    list = Agent.get(pid, fn list -> list end)
    loop list
  end

  def loop(list) do
    [head | tail] = list
    if(is_integer head) do
      [head | tail]
    else
      [right, tail1] = loop(tail)
      IO.puts right
      [left, tail2] = loop(tail1)
      IO.puts left
      case head do
        :+ -> left + right
        :- -> left - right
        :* -> left * right
      end
    end
  end
end
