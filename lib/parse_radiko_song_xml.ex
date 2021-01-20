defmodule ParseRadikoSongXml do
  @moduledoc """
    RadikoのXMLをパースする機能を提供
  """

  @doc """
    XMLをパースしてアーティストと曲名のマップにする
  """
  def parseAtristAndTitle(xml) do
      Quinn.parse(xml) |>
      Quinn.find(:item) |>
      Enum.map(fn item ->
        Enum.join([item[:attr][:artist], item[:attr][:title]], ": ") |> Mojiex.convert({:ze, :he}) |> Mojiex.convert({:zs, :hs})
      end) |>
      Enum.join("\n")
  end
end
