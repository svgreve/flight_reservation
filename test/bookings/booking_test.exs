defmodule FlightReservation.Bookings.BookingTest do
  use ExUnit.Case
  alias FlightReservation.Bookings.Booking

  describe "build/4" do
    test "if booking parameters are correct, build the booking" do
      response =
        Booking.build({2021, 4, 1, 10, 12}, "São Paulo", "Rio de Janeiro", "id do usuário")


      expected_response = %FlightReservation.Bookings.Booking{
        cidade_destino: "Rio de Janeiro",
        cidade_origem: "São Paulo",
        data_completa: ~N[2021-04-01 10:12:00],
        id: response.id,
        id_usuario: "id do usuário"
      }

      assert response == expected_response
    end
  end
end
