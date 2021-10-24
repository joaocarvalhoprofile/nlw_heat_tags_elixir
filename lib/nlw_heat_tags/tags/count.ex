defmodule NlwHeatTags.Messages.Tags.Count do
  alias NlwHeatTags.Messages.Get

  def call do
    Get.today_message()
    |> Task.async_stream(&cout_words(&1.message))
    |> Enum.reduce(%{}, fn elem, acc -> sum_values(elem, acc) end)
    |> IO.inspect()
  end

  defp cout_words(message) do
    message
    |> String.split()
    |> Enum.frequencies()
  end

  defp sum_values({:ok, map1}, map2) do
    Map.merge(map1, map2, fn _key, value1, value2 -> value1 + value2 end)
  end
end
