defmodule Streamer do
  @moduledoc """
  Documentation for Streamer.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Streamer.hello()
      :world

  """
  def find_index(dir) do
    files = Path.join(dir, "*.m3u8")
    Enum.find Path.wildcard(files), fn(file) ->
      is_index?(file)
  end

  def is_index(file) do
      File.open file, fn
        "#EXTM3U\n#EXT-X-STREAM-INF" <> _ -> true
        _ -> false
     end
  end
end
