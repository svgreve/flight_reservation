defmodule FlightReservationTest do
  use ExUnit.Case

  alias FlightReservation

  describe "create_user/1" do
    test "when all parameters are correct, create the user" do
      FlightReservation.start_agents()

      user_params = %{
        name: "Sergio",
        email: "sergio@banana.com",
        cpf: "123.456.789-00"
      }

      {:ok, user_id} = FlightReservation.create_user(user_params)

      expected_user_id = user_id

      assert user_id == expected_user_id
    end

    test "when cpf is invalid, returns an error" do
      FlightReservation.start_agents()

      user_params = %{
        name: "Sergio",
        email: "sergio@banana.com",
        cpf: "123456789"
      }

      response = FlightReservation.create_user(user_params)

      expected_response = {:error, "Invalid CPF: 123456789"}
      assert response == expected_response
    end

    test "when there are no user parameters, returns an error" do
      FlightReservation.start_agents()
      response = FlightReservation.create_user(%{})

      expected_response = {:error, "Invalid parameters"}
      assert response == expected_response
    end
  end
end
