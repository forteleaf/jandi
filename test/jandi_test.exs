defmodule JandiTest do
  use ExUnit.Case
  doctest Jandi

  test "greets the world" do
    assert Jandi.hello() == :world
  end
end
