defmodule PixelMapTest do
  use ExUnit.Case
  doctest PixelMap

  test "create map" do
    map = PixelMap.create(4, 2) |> IO.inspect()
    assert(map |> IO.inspect() == IO.inspect([[0, 0, 0, 0], [0, 0, 0, 0]]))
    assert(map |> length == 2)
  end

  test "create default map" do
    PixelMap.create() |> IO.inspect()
  end

  test "create map default" do
    assert PixelMap.create() |> length() == 7
  end

  test "char to map" do
    assert PixelMap.pixel_map_of_char("H") == [
             [1, 0, 0, 0, 1],
             [1, 0, 0, 0, 1],
             [1, 0, 0, 0, 1],
             [1, 1, 1, 1, 1],
             [1, 0, 0, 0, 1],
             [1, 0, 0, 0, 1],
             [1, 0, 0, 0, 1]
           ]
  end

  test "생성 된 맵에 문자열 배열 집어넣기" do
    map = PixelMap.create()
    h_map = PixelMap.pixel_map_of_char("H")

    aa = PixelMap.update_array(map, h_map)

    IO.inspect(aa)
  end

  test "생성 된 문자열에 두번째 글자 update 하기" do
    map = PixelMap.create()
    h_map = PixelMap.pixel_map_of_char("H")
    e_map = PixelMap.pixel_map_of_char("E")

    PixelMap.update_array(map, h_map)
    # |> PixelMap.update_at_position(&1, e_map, 0, 0)

    # bb = PixelMap.update_at_position(aa, emap, 0, 7)
    # IO.inspect(bb)
  end
end
