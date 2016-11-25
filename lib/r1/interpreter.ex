defmodule R1.Interpreter do
  def eval({:+, a, b}),
    do: a + b

  def eval({:-, a, b}),
    do: a - b

  def eval({:*, a, b}),
    do: a * b

  def eval({:/, a, b}),
    do: a / b

  def eval(ast) when is_list(ast) do
    Enum.reduce ast, fn op, _acc ->
      eval(op)
    end
  end
end
