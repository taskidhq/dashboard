defmodule Dashboard.Tasks do
  alias Dashboard.Tasks.Task

  def list do
    {:ok, response} = HTTPoison.get(url() <> "/tasks")

    response.body
    |> Jason.decode!()
    |> Enum.map(&Task.new/1)
  end

  def get(id) do
    {:ok, response} = HTTPoison.get(url() <> "/tasks/#{id}")

    response.body
    |> Jason.decode!()
    |> Task.new()
  end

  def run(task_id, inputs) do
    inputs =
      Enum.map(inputs, fn {k, v} ->
        %{id: k, value: v}
      end)
      |> Jason.encode!()

    {:ok, response} =
      HTTPoison.post(url() <> "/tasks/#{task_id}", inputs, [
        {"Content-Type", "application/json"}
      ])

    {:ok, response.body}
  end

  def url do
    Application.fetch_env!(:dashboard, :client_url)
  end
end
