defmodule FlightReservation do

  alias FlightReservation.Users.Agent, as: UserAgent
  alias FlightReservation.Users.CreateOrUpdate


  def start_agents do
    UserAgent.start_link(%{})
  end

  defdelegate create_or_update_user(params), to: CreateOrUpdate, as: :call

end
