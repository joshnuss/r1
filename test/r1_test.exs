defmodule R1Test do
  use ExUnit.Case
  doctest R1

  test "eval returns value" do
    assert R1.eval({:+, 1, 2}) == 3
  end
end
