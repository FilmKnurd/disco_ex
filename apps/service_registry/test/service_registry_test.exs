defmodule ServiceRegistryTest do
  use ExUnit.Case
  doctest ServiceRegistry

  test "greets the world" do
    assert ServiceRegistry.hello() == :world
  end
end
