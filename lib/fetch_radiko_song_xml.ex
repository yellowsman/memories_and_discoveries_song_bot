defmodule FetchRadikoSongXml do
  @moduledoc """
    Radikoの音楽リストを取得する
  """

  @doc """
    Radikoの放送局を返す
    TODO: 放送局をconfigから値を読み込んで設定する
  """
  def station(st), do: "FMT"

  @doc """
    取得期間の開始日を返す
    TODO: 開始日をconfigから値を読み込んで設定する
  """
  def from do
    Enum.join([today(), "040000"])
  end

  @doc """
    取得期間の終了日を返す
    TODO: 終了日をconfigから値を読み込んで設定する
  """
  def to do
    Enum.join([today(), "053000"])
  end

  @doc """
    RadikoのAPIをリクエストしてXMLを返す
    configから読み込んだ設定で音楽リストを取得する
  """
  def fetch do
    fetch(station(), from(), to())
  end

  @doc """
    RadikoのAPIをリクエストしてXMLを返す
    放送局のみconfigから読み込んだ値を使い、時刻は引数で指定する
  """
  def fetch(from, to) do
    fetch(station(), from, to)
  end

  @doc """
    RadikoのAPIをリクエストしてXMLを返す
  """
  def fetch(station, from, to) do
    HTTPoison.get!(target(station, from, to)).body
  end

  # 実行時の現在日を文字列で取得する
  defp today,  do: DateTime.now!("Asia/Tokyo", Tz.TimeZoneDatabase) |> DateTime.to_iso8601(:basic) |> String.split("T") |> hd

  # リクエスト先URLを構築
  defp target(station, from, to), do: Enum.join(["https://radiko.jp/v2/api/noa?station_id=", station, "&ft=", from, "&to=", to], "")
end
