defmodule CounterWeb.HomeLive.SwiftUI do
  use CounterNative, [:render_component, format: :swiftui]
  import CounterWeb.Components.BonfireComponents.SwiftUI
  import CounterWeb.Components.Profile.SwiftUI
  import CounterWeb.CoreComponents.SwiftUI

  def navigation_menu(assigns) do
    ~LVN"""
    <.user_options>
      <:option navigate={~p"/users/sign-out"} system_image="arrow.up.backward.square">
        Sign out
      </:option>
      <:option on_click="swiftui_unregister_apns" system_image="bell.badge.slash">
        Disable notifications
      </:option>
      <:option on_click="delete_user" system_image="person.fill.xmark" role={:destructive}>
        Delete account
      </:option>
      <ZStack alignment="bottomTrailing">
      <Image name="Uklg" style={[
        "resizable()",
        "frame(width: 32, height: 32)",
        "clipShape(.circle)",
        "aspectRatio(1, contentMode: .fill)"
      ]} />
        <!-- .image url={~p"/assets/images/uklg.jpg"} style="frame(width: 40, height: 40); clipShape(.circle); aspectRatio(1.777, contentMode: .fill);">
          <:success style={["
          resizable();
          frame(width: 32, height: 32);
          clipShape(.circle);
          aspectRatio(contentMode: .fill);
          "]} />
        </.image -->
      </ZStack>
    </.user_options>
    """
  end

  def search_header_menu(_assigns) do
    nil
  end

  def search_toolbar_trailing(assigns) do
    ~LVN"""
    <Button>
      <.icon name="line.3.horizontal.decrease.circle" />
    </Button>
    """
  end

  def notifications_header_menu(assigns) do
    ~LVN"""
      <.button>
          <Label systemImage="bell">All notifications</Label>
      </.button>
      <Divider/>
      <.button>
      <Label systemImage="eye">Follow</Label>
      </.button>
      <.button>
      <Label systemImage="person.2">Follow requests</Label>
      </.button>
      <.button>
      <Label systemImage="globe">Mentions</Label>
      </.button>
      <.button phx-click="show_filters">
        <Label systemImage="line.3.horizontal.decrease.circle">Boosts</Label>
      </.button>
      <.button phx-click="show_filters">
        <Label systemImage="line.3.horizontal.decrease.circle">Posts</Label>
      </.button>
      <.button phx-click="show_filters">
        <Label systemImage="line.3.horizontal.decrease.circle">Favourited</Label>
      </.button>
      <.button phx-click="show_filters">
        <Label systemImage="line.3.horizontal.decrease.circle">Polls</Label>
      </.button>
      <.button phx-click="show_filters">
        <Label systemImage="line.3.horizontal.decrease.circle">Edited posts</Label>
      </.button>
      """
  end

  def notifications_toolbar_trailing(assigns) do
    ~LVN"""
    <Button>
      <.icon name="line.3.horizontal.decrease.circle" />
    </Button>
    """
  end

  def profile_toolbar_trailing(assigns) do
    ~LVN"""
    <Button>
      <.icon name="line.3.horizontal.decrease.circle" />
    </Button>
    """
  end

  def direct_messages_toolbar_trailing(assigns) do
    ~LVN"""
    <Button>
      <.icon name="plus" />
    </Button>
    """
  end


  def home_header_menu(assigns) do
    ~LVN"""
    <.button>
        <Label systemImage="house">Home</Label>
    </.button>
      <.button>
      <Label systemImage="eye">Following</Label>
      </.button>
      <.button>
      <Label systemImage="person.2">Local</Label>
      </.button>
      <.button>
      <Label systemImage="globe">Remote</Label>
      </.button>
      <Divider/>
      <.button phx-click="show_filters">
        <Label systemImage="line.3.horizontal.decrease.circle">Filters</Label>
      </.button>
    """
  end

  def home_toolbar_trailing(assigns) do
    ~LVN"""
    <Button>
      <.icon name="gear" />
    </Button>
    """
  end


end
