defmodule MemoriesAndDiscoveriesSongBot do
  @moduledoc """
  Documentation for `MemoriesAndDiscoveriesSongBot`.
  """

  def songlist(date), do: FetchRadikoSongXml.fetch(date) |> ParseRadikoSongXml.parseAtristAndTitle()

  def songlist(date, from_time, to_time), do: songlist(Enum.join([date, from_time]), Enum.join([date, to_time]))
 
  def songlist(from, to), do: FetchRadikoSongXml.fetch(from, to) |> ParseRadikoSongXml.parseAtristAndTitle()

  def songlist, do: FetchRadikoSongXml.fetch() |> ParseRadikoSongXml.parseAtristAndTitle()
end
