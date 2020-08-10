defmodule FizzbuzzTest do
  use ExUnit.Case

  describe "build/1" do
    test "when exist a file to read, return a list" do
      expected = {:ok, [1, :fizz, :buzz, :fizzbuzz, :buzz]}

      assert Fizzbuzz.build("numeros.txt") == expected
    end

    test "when the file is not valid, return a list" do
      expected = {:error, "Fail when read file. enoent"}

      assert Fizzbuzz.build("nus.txt") == expected
    end

  end

end
