defmodule FetchRadikoSongXml do
  @moduledoc """
    Radikoの音楽リストを取得する
  """

  @doc """
    RadikoのAPIをリクエストしてXMLを返す
    日付だけ指定すれば良い版
  """
  def fetch(date), do: fetch(date, start_at(), end_at())

  @doc """
    RadikoのAPIをリクエストしてXMLを返す
    日付と時間をより簡単に指定できるようにした
  """
  def fetch(date, from_time, to_time), do: fetch(Enum.join([date, from_time]), Enum.join([date, to_time]))

  @doc """
    RadikoのAPIをリクエストしてXMLを返す
    configから読み込んだ設定で音楽リストを取得する
  """
  def fetch, do: fetch(from(), to())

  @doc """
    RadikoのAPIをリクエストしてXMLを返す
    放送局のみconfigから読み込んだ値を使い、時刻は引数で指定する
  """
  def fetch(from, to), do: _fetch(station(), from, to)


# ------------------------------------------------
# 以下は具体的な取得処理なのでprivateにして隠蔽
# ------------------------------------------------

  # 指定された情報でRadikoから情報を取得
  defp _fetch(station, from, to), do: HTTPoison.get!(target(station, from, to)).body

  # 実行時の現在日を文字列で取得する
  defp today,  do: DateTime.now!("Asia/Tokyo", Tz.TimeZoneDatabase) |> DateTime.to_iso8601(:basic) |> String.split("T") |> hd

  # リクエスト先URLを構築
  defp target(station, from, to), do: Enum.join(["https://radiko.jp/v2/api/noa?station_id=", station, "&ft=", from, "&to=", to], "")

  #  TODO: 放送局をconfigから値を読み込んで設定する
  defp station(), do: "FMT"

  # 取得範囲の開始日時を返す
  defp from, do: Enum.join([today(), start_at()])

  #  TODO: 開始日をconfigから値を読み込んで設定する
  defp start_at, do: "040000"

  # 取得範囲の終了日時を返す
  defp to, do: Enum.join([today(), end_at()])

  #  TODO: 終了日をconfigから値を読み込んで設定する
  defp end_at, do: "053000"
end
