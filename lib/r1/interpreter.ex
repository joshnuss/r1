defmodule R1.Interpreter do
  def eval(ast) do
    {_binding, last} = do_eval(ast, %{})
    last
  end

  defp do_eval({:+, a, b}, binding) do
    {aval, bval} = extract_literals(a, b, binding)

    {binding, aval + bval}
  end

  defp do_eval({:-, a, b}, binding) do
    {aval, bval} = extract_literals(a, b, binding)

    {binding, aval - bval}
  end

  defp do_eval({:*, a, b}, binding) do
    {aval, bval} = extract_literals(a, b, binding)

    {binding, aval * bval}
  end

  defp do_eval({:/, a, b}, binding) do
    {aval, bval} = extract_literals(a, b, binding)

    {binding, aval / bval}
  end

  defp do_eval({:=, name, expr}, binding) do
    {_, value} = do_eval(expr, binding)

    {Map.put(binding, name, value), value}
  end

  defp do_eval({:ref, name}, binding),
    do: { binding, Map.fetch!(binding, name) }

  defp do_eval({:ref, name, params}, binding) do
    {args, ops} = Map.fetch!(binding, name)

    child = args |> Enum.zip(params) |> Enum.into(%{})
    {_, result } = do_eval(ops, child)

    {binding, result}
  end

  defp do_eval({:fn, name, patterns}, binding) do
    {binding, _val} = do_eval({:=, name, patterns}, binding)
    {binding, nil}
  end

  defp do_eval(ast, binding) when is_list(ast) do
    state = {binding, nil}

    Enum.reduce ast, state, fn op, {binding, _last} ->
      do_eval(op, binding)
    end
  end

  defp do_eval(literal, binding),
    do: {binding, literal}

  defp extract_literals(a, b, binding) do
    {_, aval} = do_eval(a, binding)
    {_, bval} = do_eval(b, binding)

    {aval, bval}
  end
end
