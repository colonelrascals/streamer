defmodule Streamer do
  @moduledoc """
  Documentation for Streamer.
  """

  @doc """
  Find index file of .m3u8 file
  """
  def find_index(dir) do
    files = Path.join(dir, "*.m3u8")

    Enum.find(Path.wildcard(files), fn file ->
      is_index?(file)
    end)
  end

  defp is_index(file) do
    File.open!(file, fn pid ->
      IO.read(file, 25) == "#EXTM3U\n#EXT-X-STREAM-INF"
    end)
  end
end
