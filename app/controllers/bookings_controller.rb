class BookingsController < ApplicationController

  def index
    @bookings = policy_scope(Booking)
  end

  def show
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def new
    @product = Product.find(params[:product_id])
    @booking = Booking.new
    authorize @booking
  end

  def create
    @product = Product.find(params[:product_id])
    @booking = Booking.new(booking_params)
    @booking.user_id = current_user.id
    @booking.product_id = @product.id
    @days = (@booking.end_date - @booking.start_date).to_i
    @booking.booking_price = @days * @product.price
    authorize @booking
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
