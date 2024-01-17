defmodule PixelMap do
  def create(width \\ 25, height \\ 7) do
    map = for _ <- 1..height, do: for(_ <- 1..width, do: 0)
    map
  end

  @spec update_array(map(), map()) :: map()
  def update_array(original, update) do
    Enum.with_index(update)
    |> Enum.reduce(original, fn {row, row_index}, acc ->
      Enum.with_index(row)
      |> Enum.reduce(acc, fn {value, col_index}, acc2 ->
        List.replace_at(
          List.replace_at(
            acc2,
            row_index,
            List.replace_at(Enum.at(acc2, row_index), col_index, value)
          ),
          row_index,
          List.replace_at(Enum.at(acc2, row_index), col_index, value)
        )
      end)
    end)
  end

  @spec update_at_position(map(), map(), non_neg_integer(), non_neg_integer()) :: list()
  def update_at_position(matrix, update_matrix, row, col) do
    Enum.with_index(matrix)
    |> Enum.map(fn {old_row, i} ->
      if i >= row and i < row + length(update_matrix) do
        update_row(old_row, Enum.at(update_matrix, i - row), col)
      else
        old_row
      end
    end)
  end

  defp update_row(old_row, new_row, col) do
    Enum.with_index(old_row)
    |> Enum.map(fn {old_val, i} ->
      if i >= col and i < col + length(new_row) do
        Enum.at(new_row, i - col)
      else
        old_val
      end
    end)
  end

  def pixel_map_of_char(char) do
    case char do
      "H" ->
        [
          [1, 0, 0, 0, 1],
          [1, 0, 0, 0, 1],
          [1, 0, 0, 0, 1],
          [1, 1, 1, 1, 1],
          [1, 0, 0, 0, 1],
          [1, 0, 0, 0, 1],
          [1, 0, 0, 0, 1]
        ]

      "E" ->
        [
          [1, 1, 1, 1, 1],
          [1, 0, 0, 0, 0],
          [1, 0, 0, 0, 0],
          [1, 1, 1, 1, 1],
          [1, 0, 0, 0, 0],
          [1, 0, 0, 0, 0],
          [1, 1, 1, 1, 1]
        ]

      "L" ->
        [
          [1, 0, 0, 0, 0],
          [1, 0, 0, 0, 0],
          [1, 0, 0, 0, 0],
          [1, 0, 0, 0, 0],
          [1, 0, 0, 0, 0],
          [1, 0, 0, 0, 0],
          [1, 1, 1, 1, 1]
        ]

      "O" ->
        [
          [0, 1, 1, 1, 0],
          [1, 0, 0, 0, 1],
          [1, 0, 0, 0, 1],
          [1, 0, 0, 0, 1],
          [1, 0, 0, 0, 1],
          [1, 0, 0, 0, 1],
          [0, 1, 1, 1, 0]
        ]

      _ ->
        [
          [0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0]
        ]
    end
  end
end
