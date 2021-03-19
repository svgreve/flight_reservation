defmodule FlightReservation.Bookings.Booking do
  @keys [:id, :data_completa, :cidade_origem, :cidade_destino, :id_usuario]
  @enforce_keys @keys
  defstruct @keys

  def build do
    {:ok, "created"}
  end
end
