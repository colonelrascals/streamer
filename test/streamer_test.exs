defmodule StreamerTest do
  use ExUnit.Case
  doctest Streamer

  test "find the index file in a directory" do
    assert Streamer.find_index('path/to/dir')
  end
end
