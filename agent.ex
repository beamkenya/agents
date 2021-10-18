defmodule Football do
  use Agent

  def start_link do
    Agent.start_link(fn -> %{time: Time.utc_now(), match_status: :on_play, goal: 0, half_time: %{start_time: 0, end_time: 0}} end, name: __MODULE__)
  end


 def time_elapsed do
  Agent.get(__MODULE__, fn  state -> Time.diff(Time.utc_now(), state.time)end)
 end


 def call_half_time() do
  Agent.update(__MODULE__, fn state -> %{state | match_status: :half_time, half_time: %{start_time: Time.utc_now, end_time: 0}} end)
 end

 def game_state() do
  Agent.get(__MODULE__, fn state -> state end)
 end


end

