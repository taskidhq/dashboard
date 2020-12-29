defmodule Dashboard.Tasks.Task do
  alias Dashboard.Tasks.Task.Input

  defstruct name: nil,
            id: nil,
            description: nil,
            inputs: []

  def new(attrs) do
    struct!(__MODULE__, %{
      id: attrs["id"],
      name: attrs["name"],
      description: attrs["description"],
      inputs: Enum.map(attrs["inputs"] || [], &Input.new/1)
    })
  end
end
