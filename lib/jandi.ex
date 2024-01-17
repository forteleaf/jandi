defmodule Jandi do
  @moduledoc """
  Documentation for `Jandi`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Jandi.hello()
      :world

  """
  def hello do
    :world
  end

  def main do
    pixel_map = PixelMap.create(50, 7)
    pixel_map
  end
end
