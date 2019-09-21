defmodule KualiChatWeb.ChatLive do
  use Phoenix.LiveView
  alias KualiChatWeb.ChatView
  alias KualiChat.Chat

  def render(assigns) do
    ChatView.render("index.html", assigns)
  end

  def mount(_session, socket) do
    if connected?(socket), do: Chat.subscribe()
    {:ok, assign(socket, count: 0, messages: [], current_message: "")}
  end

  def handle_event("inc", _event, socket) do
    {:noreply, update(socket, :count, fn count -> count + 1 end)}
  end

  def handle_event("send_message", %{"message" => %{"body" => body}}, socket) do
    Chat.broadcast({:kualichat, body})
    {:noreply, assign(socket, current_message: "")}
  end

  def handle_event("update", %{"message" => %{"body" => body}}, socket) do
    {:noreply, assign(socket, current_message: body)}
  end

  def handle_info({:kualichat, body}, socket) do
    {:noreply, update(socket, :messages, fn messages -> [body | messages] end)}
  end
end
