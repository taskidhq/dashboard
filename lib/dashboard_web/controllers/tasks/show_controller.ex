defmodule DashboardWeb.Tasks.ShowController do
  use DashboardWeb, :controller

  alias Dashboard.Tasks
  alias DashboardWeb.TasksView

  def show(conn, %{"id" => task_id}) do
    task = Tasks.get(task_id)

    conn
    |> put_view(TasksView)
    |> render("show.html", task: task)
  end
end
