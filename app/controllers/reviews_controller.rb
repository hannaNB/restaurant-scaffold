class ReviewsController < ApplicationController
    before_action :set_restaurant

    def new
        # build : comme un new mais le restaurant ID est pré-remplis
        @review = @restaurant.reviews.build
    end
    def create
        @review = Review.new(review_params)
        @review.restaurant = @restaurant
        @review.save
        redirect_to restaurant_path(@restaurant)
    end 

    private
    def set_restaurant
        @restaurant = Restaurant.find(params[:restaurant_id])
    end
    def review_params
        params.require(:review).permit(:content)
    end

end
