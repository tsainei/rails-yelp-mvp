class ReviewsController < ApplicationController
  before_action :set_restaurant, only: [:new, :create]
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    if @review.save
      flash[:notice] = "Thanks for your review!"
      redirect_to restaurant_path(@restaurant)
    else
      flash[:error] = "Something went wrong!"
      Rails.logger.error @review.errors.details
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def index
  end

  def show
  end

  def update
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to restaurant_path(@review.restaurant)
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
