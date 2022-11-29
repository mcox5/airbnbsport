class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def new
    @product = Product.find(params[:product_id])
    @booking = Booking.new
  end

  def create
    @product = Product.find(params[:product_id])
    @booking = Booking.new(booking_params)
    @booking.user_id = current_user.id
    @booking.product_id = @product.id
    @days = (@booking.end_date - @booking.start_date).to_i
    @booking.booking_price = @days * @product.price
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(
      :start_date, :end_date
    )
  end
end
