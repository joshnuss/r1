defmodule R1.Interpreter do
  def eval({:+, a, b}),
    do: a + b
end
