defmodule CounterWeb.HomeLive do
  use CounterWeb, :live_view
  use CounterNative, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket
    |> assign(
      counter: 0,
      swiftui_tab: "home",
      searchText: "",
      toolbar_trailing: :home_toolbar_trailing,
      navigation_menu: :home_navigation_menu,
      header_menu: :home_header_menu,
      page_title: "Home",
      show_search: false,
      show_header_menu: true,
      showFiltersSheet: false)}
  end


  def handle_event("go_to_search", _params, socket) do
    # live_push to /search
    {:noreply, push_navigate(socket, to: "/search")}
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

  def handle_event("swiftui_tab_selection", %{"selection" => tab}, socket) do
    {header_menu, toolbar_trailing, navigation_menu, page_title} =
      case tab do
        "home" ->
          {:home_header_menu, :home_toolbar_trailing, :home_navigation_menu, "Home"}

        "notifications" ->
          {:notifications_header_menu, :notifications_toolbar_trailing, :notifications_navigation_menu, "Notifications"}

        "direct_messages" ->
          {:direct_messages_header_menu, :direct_messages_toolbar_trailing, :direct_messages_navigation_menu, "Direct Messages"}

        "search" ->
          {:search_header_menu, :search_toolbar_trailing, :search_navigation_menu, "Search"}

        "profile" ->
          {:profile_header_menu, :profile_toolbar_trailing, :profile_navigation_menu, "Profile"}

        _ ->
          {nil, nil, nil, ""}
      end

    show_header_menu = tab in ["home", "notifications"]
    {:noreply, socket
    |> assign(
      swiftui_tab: tab,
      searchText: "",
      header_menu: header_menu,
      show_header_menu: show_header_menu,
      navigation_menu: navigation_menu,
      show_search: tab == "search",
      page_title: page_title,
      toolbar_trailing: toolbar_trailing
    )}
  end


end
