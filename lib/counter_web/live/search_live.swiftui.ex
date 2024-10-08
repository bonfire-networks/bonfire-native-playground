defmodule CounterWeb.SearchLive.SwiftUI do
  use CounterNative, [:render_component, format: :swiftui]

  import CounterWeb.Components.BonfireComponents.SwiftUI

  # FIXME this doesn't seem to work to automatically focus the search: isPresented: attr("isSearchPresented"),
end
