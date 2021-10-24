defmodule NlwHeatTags.Messages.Get do
  import Ecto.Query

  alias NlwHeatTags.Messages.Message
  alias NlwHeatTags.Repo

  def today_message do
    today = Date.utc_today()
    query = from message in Message, where: type(message.inserted_at, :date) == ^today

    Repo.all(query)
  end
end
