defmodule R1.Interpreter do
  def eval({:+, a, b}),
    do: a + b

  def eval({:-, a, b}),
    do: a - b

  def eval({:*, a, b}),
    do: a * b

  def eval({:/, a, b}),
    do: a / b
end
