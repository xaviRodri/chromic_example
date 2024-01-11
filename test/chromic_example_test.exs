defmodule ChromicExampleTest do
  use ExUnit.Case
  doctest ChromicExample

  test "greets the world" do
    assert ChromicExample.hello() == :world
  end
end
