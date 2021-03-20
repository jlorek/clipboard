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
    <div id="counter"
         phx-hook="Counter"
         x-data="{count: <%= @count %>}"
         x-init="$watch('count', value => { console.log('watcher', value) })"">
      <h1>The assigns counter is: <span><%= @count %></span></h1>
      <h1>The alpine count is: <span x-text="count"></span></h1>
      <button phx-click="decrement">Decrement</button>
      <button phx-click="increment">Increment</button>
      <br />
      <button @click="counterHook.decrement()">Alpine hook decrement</button>
      <button @click="counterHook.increment('#counter')">Alpine hook increment</button>
      <br />
      <button @click="counterHook.pushEvent('decrement', {})">Alpine direct decrement</button>
      <button @click="counterHook.pushEventTo('#counter', 'increment', {})">Alpine direct increment</button>
    </div>
    """
  end
end
