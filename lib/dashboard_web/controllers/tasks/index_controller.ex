defmodule DashboardWeb.Tasks.IndexController do
  use DashboardWeb, :controller

  alias Dashboard.Tasks
  alias DashboardWeb.TasksView

  def index(conn, _params) do
    tasks = Tasks.list()

    conn
    |> put_view(TasksView)
    |> render("index.html", tasks: tasks)
  end
end
