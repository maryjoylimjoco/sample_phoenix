defmodule Sample.View do
  use Phoenix.View, root: "web/templates"

  def csrf_token(conn) do
    Map.get(conn.req_cookies,"_csrf_token")
  end
end
