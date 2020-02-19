class Api::BenchesController < ApplicationController
  def index
    @benches = params[:bounds] ? Bench.in_bounds(params[:bounds]) : Bench.all
    if params[:minSeating] && params[:maxSeating]
      @benches = @benches.where(seating: seating_range)
    end

    render :index
  end

  def show
    @bench = Bench.find(params[:id])
  end

  def create
    @bench = Bench.new(bench_params)
    if @bench.save
      render :show
    else
      render json: @bench.errors.full_messages, status: 422
    end
  end

  private

  def bench_params
    params.require(:bench).permit(
      :description,
      :lat,
      :lng,
      :seating
    )
  end

  def seating_range
    (params[:minSeating]..params[:maxSeating])
  end
end
