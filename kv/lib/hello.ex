defmodule Hello do
    @doc """
    mix 任务测试
    在运行mix compile编译后，只要在控制台运行 mix HelloY就可以直接调用run的内容
    每次打都会输出"hello world"
    """
    def say(content) do
        IO.puts "hello, #{content}"
    end
end

defmodule Mix.Tasks.HelloY do
    use Mix.Task

    def run(content) do
        Hello.say(content)
    end
end