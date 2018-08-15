defmodule Grains do
  @doc """
  Calculate two to the power of the input minus one.
  """
  @spec square(pos_integer) :: pos_integer
  def square(num) when num < 1 or num > 64 do
    {:error, "The requested square must be between 1 and 64 (inclusive)"}
  end
  def square(num) do
    squared = Stream.unfold(0, fn
      0 -> {1, 1}
      n -> {n * 2, n * 2}
    end)
    |> Enum.take(num)
    |> List.last()
    {:ok, squared}
  end

  @doc """
  Adds square of each number from 1 to 64.
  """
  @spec total :: pos_integer
  def total do
    sum = (for n <- 1..64, do: square(n) |> elem(1))
    |> Enum.sum()
    {:ok, sum}
  end
end
