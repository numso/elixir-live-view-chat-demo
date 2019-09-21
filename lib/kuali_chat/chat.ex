defmodule KualiChat.Chat do
  @topic inspect(__MODULE__)

  def subscribe do
    Phoenix.PubSub.subscribe(KualiChat.PubSub, @topic)
  end

  def broadcast(message) do
    Phoenix.PubSub.broadcast(KualiChat.PubSub, @topic, message)
  end
end
