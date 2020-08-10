defmodule Fizzbuzz do
  @moduledoc """
  Read a file with name "numeros.txt" and parse each number
  converting to fizz, buzz or fizzbuzz if it's multiple of 3,5 or (3 and 5)
  """

  def build(filename) do
    filename
    |> File.read()
    |> handle_read_file()
  end

  def handle_read_file({:ok, result}) do
    return =
      result
      |> String.trim()
      |> String.split(",")
      |> Enum.map(&convert_and_evaluate/1)

    {:ok, return}
  end
  def handle_read_file({:error, reason}), do: {:error, "Fail when read file. #{reason}"}

  def convert_and_evaluate(number) do
    number
    |> String.to_integer()
    |> eval_number()
  end

  def eval_number(number) when rem(number, 3) == 0 and rem(number,5) == 0, do: :fizzbuzz
  def eval_number(number) when rem(number, 3) == 0, do: :fizz
  def eval_number(number) when rem(number, 5) == 0, do: :buzz
  def eval_number(number), do: number
end
