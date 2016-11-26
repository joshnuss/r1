defmodule X1Test do
  use ExUnit.Case
  doctest X1

  test "eval returns value" do
    assert X1.eval({:+, 1, 2}) == 3
  end
end
