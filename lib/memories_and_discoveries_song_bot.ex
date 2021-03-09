defmodule MemoriesAndDiscoveriesSongBot do
  @moduledoc """
  Documentation for `MemoriesAndDiscoveriesSongBot`.
  """

  def songlist(date), do: IO.puts(FetchRadikoSongXml.fetch(date) |> ParseRadikoSongXml.parseAtristAndTitle)

  def songlist(date, from_time, to_time), do: songlist(Enum.join([date, from_time]), Enum.join([date, to_time]))
 
  def songlist(from, to), do: IO.puts(FetchRadikoSongXml.fetch(from, to) |> ParseRadikoSongXml.parseAtristAndTitle)

  def songlist, do: IO.puts(FetchRadikoSongXml.fetch() |> ParseRadikoSongXml.parseAtristAndTitle)
end
