defmodule MemoriesAndDiscoveriesSongBot.CLI do
  @moduledoc """
    実行日のTOKYO FMのAM 04:00 ~ 05:30 の間の曲情報を取得する
  """

  def main(args \\ []) do
    args
    |> response
    |> IO.puts()
  end

  defp response(date) do
    if Enum.empty?(date), do: today(), else: at(date)
  end

  defp today do
    {:ok, parse} = MemoriesAndDiscoveriesSongBot.songlist()
    parse
  end

  defp at(date) do
    {:ok, parse} = MemoriesAndDiscoveriesSongBot.songlist(date)
    parse
  end
end
