defmodule CounterWeb.SearchLive do
  use CounterWeb, :live_view
  use CounterNative, :live_view


  @impl true
  def mount(_params, _session, socket) do
    {:ok,
    socket
    |> assign(
      searchText: "",
      isSearchPresented: true,
      showFiltersSheet: false
     )
   }
  end

  def handle_event("search", %{"searchText" => search_text}, socket) do
    # Implement your search logic here
    {:noreply, assign(socket, searchText: search_text)}
  end

  def handle_event("search-changed", params, socket) do
    # is_presented = String.to_existing_atom(is_presented)
    IO.inspect(params, label: "is_presented")


    {:noreply, socket}
  end


  @impl true
  def render(assigns) do
    ~H"""
    <div class="text-center text-9xl"><%= @counter %></div>
    <div class="flex flex-col items-center"><button class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-1 px-5 rounded" phx-click="incr">+1</button></div>
    """
  end

end
