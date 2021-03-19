defmodule FlightReservation do
  alias FlightReservation.Bookings.Agent, as: BookingAgent
  alias FlightReservation.Bookings.CreateOrUpdate, as: CreateOrUpdateBooking

  alias FlightReservation.Users.Agent, as: UserAgent
  alias FlightReservation.Users.CreateOrUpdate, as: CreateOrUpdateUser

  def start_agents do
    UserAgent.start_link(%{})
    BookingAgent.start_link(%{})
  end

  defdelegate create_or_update_user(user_params), to: CreateOrUpdateUser, as: :call

  defdelegate create_or_update_booking(user_id, booking_params), to: CreateOrUpdateBooking, as: :call
end
