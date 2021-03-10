defmodule ParseRadikoSongXml do
  @moduledoc """
    RadikoのXMLをパースする機能を提供
  """

  def parseAtristAndTitle(xml) when xml === "forbidden", do: {:error, "曲情報を取得できませんでした"}

  @doc """
    XMLをパースしてアーティストと曲名のマップにする
  """
  def parseAtristAndTitle(xml) do
      parse = Quinn.parse(xml)
      |> Quinn.find(:item)
      |> Enum.map(fn item ->
        Enum.join([item[:attr][:artist], item[:attr][:title]], ": ") |> Mojiex.convert({:ze, :he}) |> Mojiex.convert({:zs, :hs})
      end)
      |> Enum.join("\n")

      {:ok, parse}
  end
end
