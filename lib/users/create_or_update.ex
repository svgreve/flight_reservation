defmodule FlightReservation.Users.CreateOrUpdate do
  alias FlightReservation.Users.Agent, as: UserAgent
  alias FlightReservation.Users.User

  def call(%{name: name, email: email, cpf: cpf}) do
     User.build(name, email, cpf)
     |> save_user()
  end

  defp save_user( %User{} = user ) do
    UserAgent.save(user)
    {:ok, user}
  end


end
