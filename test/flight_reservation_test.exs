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

    test "when cpf is invalid, returns an error" do
      FlightReservation.start_agents()

      user_params = %{
        name: "Sergio",
        email: "sergio@banana.com",
        cpf: "123456789"
      }

      response = FlightReservation.create_or_update_user(user_params)

      expected_response = {:error, "Invalid CPF: 123456789"}
      assert response == expected_response
    end

    test "when there are no user parameters, returns an error" do
      FlightReservation.start_agents()
      response = FlightReservation.create_or_update_user(%{})

      expected_response = {:error, "Invalid parameters"}
      assert response == expected_response
    end
  end
end
