class SportsController < ApplicationController
  def index
    @sports = Sport.all
  end

  def new
    @sport = Sport.new
  end

  def create
    @sport = Sport.new(sport_params)
    if @sport.save
      flash[:notice] = "Your sport was successfully created"
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def sport_params
    params.require(:sport).permit(
      :name, :photo
    )
  end
end
