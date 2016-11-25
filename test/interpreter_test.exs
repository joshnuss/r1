defmodule R1.InterpreterTest do
  use ExUnit.Case
  doctest R1.Interpreter

  import R1.Interpreter, only: [eval: 1]

  describe "math expressions" do
    test "adds literals" do
      assert eval({:+, 1, 2}) == 3
    end

    test "subtracts literals" do
      assert eval({:-, 7, 2}) == 5
    end

    test "multiple literals" do
      assert eval({:*, 7, 2}) == 14
    end

    test "divides literals" do
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

  describe "variables" do
    test "declaratation" do
      assert eval({:=, :x, 100}) == 100
    end

    test "accessing" do
      ops = [
        {:=, :x, 100},
        {:ref, :x}
      ]
      assert eval(ops) == 100
    end

    test "updating" do
      ops = [
        {:=, :x, 100},
        {:=, :x, 22},
        {:ref, :x}
      ]
      assert eval(ops) == 22
    end

    test "addition" do
      ops = [
        {:=, :x, 100},
        {:+, {:ref, :x}, {:ref, :x}}
      ]
      assert eval(ops) == 200
    end

    test "subtraction" do
      ops = [
        {:=, :x, 100},
        {:-, {:ref, :x}, {:ref, :x}}
      ]
      assert eval(ops) == 0
    end

    test "multiplication" do
      ops = [
        {:=, :x, 100},
        {:*, {:ref, :x}, {:ref, :x}}
      ]
      assert eval(ops) == 10000
    end

    test "division" do
      ops = [
        {:=, :x, 100},
        {:/, {:ref, :x}, {:ref, :x}}
      ]
      assert eval(ops) == 1
    end
  end
end
