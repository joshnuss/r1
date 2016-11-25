defmodule R1.InterpreterTest do
  use ExUnit.Case
  import R1.Interpreter, only: [eval: 1]
  doctest R1.Interpreter

  test "adds values" do
    assert eval({:+, 1, 2}) == 3
  end

  test "subtracts values" do
    assert eval({:-, 7, 2}) == 5
  end

  test "multiple values" do
    assert eval({:*, 7, 2}) == 14
  end
end
