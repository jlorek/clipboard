defmodule ClipboardWeb.CounterLive do
  use ClipboardWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, assign(socket, count: 0)}
  end

  def handle_event("increment", _params, socket) do
    {:noreply, update(socket, :count, &(&1 + 1))}
  end

  def handle_event("decrement", _params, socket) do
    {:noreply, update(socket, :count, &(&1 - 1))}
  end

  def render(assigns) do
    ~L"""
    <div id="counter" phx-hook="Counter" x-data="{}">
      counter_live.ex
      <h1>The counter is: <span><%= @count %></span></h1>
      <button phx-click="decrement">Decrement</button>
      <button phx-click="increment">Increment</button>

      <button @click="counterHook.decrement()">Alpine Decrement</button>
      <button @click="counterHook.increment('#counter')">Alpine Increment</button>
    </div>
    """
  end
end
