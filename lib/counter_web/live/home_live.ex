defmodule CounterWeb.HomeLive do
  use CounterWeb, :live_view
  use CounterNative, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
    socket
    |> assign(
      counter: 0,
      swiftui_tab: :search,
      showFiltersSheet: true
     )
   }
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div class="text-center text-9xl"><%= @counter %></div>
    <div class="flex flex-col items-center"><button class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-1 px-5 rounded" phx-click="incr">+1</button></div>
    """
  end

  def handle_event("show_filters", _params, socket) do
    {:noreply, assign(socket, showFiltersSheet: true)}
  end

  def handle_event("dismiss_filters", _params, socket) do
    {:noreply, assign(socket, showFiltersSheet: false)}
  end

  @impl true
  def handle_event("incr", _params, socket) do
    {:noreply, assign(socket, :counter, socket.assigns.counter + 1)}
  end
end
