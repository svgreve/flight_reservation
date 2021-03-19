defmodule FlightReservation.Bookings.CreateOrUpdate do
  alias FlightReservation.Bookings.Agent, as: BookingAgent
  alias FlightReservation.Bookings.Booking

  def call(
        id_usuario,
         %{
           ano: ano,
           mes: mes,
           dia: dia,
           hora: hora,
           minuto: minuto,
           cidade_origem: cidade_origem,
           cidade_destino: cidade_destino
         })
       do
    Booking.build({ano, mes, dia, hora, minuto}, cidade_origem, cidade_destino, id_usuario)
    |> save_booking()
  end

  def call(%{}), do: {:error, "Invalid parameters"}

  defp save_booking(%Booking{} = booking) do
    BookingAgent.save(booking)
    {:ok, booking}
  end
end
