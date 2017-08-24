defmodule AWSPricing.Repo do
  @behaviour :gen_statem

  defstruct []

  @type child_spec :: %{
    id: __MODULE__,
    restart: :permanent,
    shutdown: 5000,
    start: {__MODULE__, :start_link, []},
    type: :worker,
  }

  #######
  # API #
  #######

  @doc false
  @spec start_link() :: {:ok,pid()}
  def start_link() do
    name = {:local, __MODULE__}
    state = %__MODULE__{}
    options = []
    :gen_statem.start_link(name,__MODULE__,state,options)
  end

  #############
  # Callbacks #
  #############

  @doc false
  @spec callback_mode() :: :handle_event_function
  def callback_mode, do: :handle_event_function

  @doc false
  @spec child_spec(any()) :: child_spec()
  def child_spec(_) do
    %{
      id: __MODULE__,
      restart: :permanent,
      shutdown: 5000,
      start: {__MODULE__, :start_link, []},
      type: :worker,
    }
  end

  @doc false
  @spec init(any()) :: {:ok,:idle,%__MODULE__{}}
  def init(_) do
    state = :idle
    data = %__MODULE__{}
    {:ok,state,data}
  end
end
