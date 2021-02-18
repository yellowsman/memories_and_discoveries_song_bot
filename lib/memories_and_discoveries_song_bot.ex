defmodule MemoriesAndDiscoveriesSongBot do
  @moduledoc """
  Documentation for `MemoriesAndDiscoveriesSongBot`.
  """


  def songlist(year, month, day, from_time, to_time), do: IO.puts(FetchRadikoSongXml.fetch(year, month, day, from_time, to_time) |> ParseRadikoSongXml.parseAtristAndTitle)

  def songlist(date, from_time, to_time), do: songlist(Enum.join([date, from_time]), Enum.join([date, to_time]))
 
  def songlist(from, to), do: IO.puts(FetchRadikoSongXml.fetch(from, to) |> ParseRadikoSongXml.parseAtristAndTitle)

  def songlist, do: IO.puts(FetchRadikoSongXml.fetch() |> ParseRadikoSongXml.parseAtristAndTitle)
end
