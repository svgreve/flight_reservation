defmodule FlightReservationTest do
  use ExUnit.Case

  alias FlightReservation

  describe "create_or_update_user/1" do
    test "when all parameters are correct, create the user" do
      FlightReservation.start_agents()

      user_params = %{
        name: "Sergio",
        email: "sergio@banana.com",
        cpf: "123.456.789-00"
      }

      {:ok, user} = FlightReservation.create_or_update_user(user_params)

      expected_user = %FlightReservation.Users.User{
        cpf: "123.456.789-00",
        email: "sergio@banana.com",
        id: user.id,
        name: "Sergio"
      }


      assert user == expected_user
    end
  end
end
