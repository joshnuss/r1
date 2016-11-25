defmodule R1.InterpreterTest do
  use ExUnit.Case
  import R1.Interpreter, only: [eval: 1]
  doctest R1.Interpreter

  describe "math expressions" do

    test "adds values" do
      assert eval({:+, 1, 2}) == 3
    end

    test "subtracts values" do
      assert eval({:-, 7, 2}) == 5
    end

    test "multiple values" do
      assert eval({:*, 7, 2}) == 14
    end

    test "divides values" do
      assert eval({:/, 7, 2}) == 3.5
    end
  end

  test "returns last value when multiple expressions" do
    ops = [
      {:+, 1, 2},
      {:+, 3, 4}
    ]

    assert eval(ops) == 7
  end
end
