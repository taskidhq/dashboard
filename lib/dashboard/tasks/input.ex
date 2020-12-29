defmodule Dashboard.Tasks.Task.Input do
  defstruct id: nil,
            label: nil,
            type: nil,
            default: nil,
            placeholder: nil

  def new(attrs) do
    struct!(__MODULE__, %{
      id: attrs["id"],
      label: attrs["label"],
      type: attrs["type"],
      default: attrs["default"],
      placeholder: attrs["placeholder"]
    })
  end
end
