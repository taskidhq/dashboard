defmodule DashboardWeb.Tasks.RunController do
  use DashboardWeb, :controller

  alias Dashboard.Tasks
  alias DashboardWeb.TasksView

  def run(conn, %{"id" => task_id, "inputs" => inputs}) do
    task = Tasks.get(task_id)
    {:ok, result} = Tasks.run(task_id, inputs)

    conn
    |> put_view(TasksView)
    |> render("show.html", task: task, result: result)
  end
end
