class RatingController < ApplicationController

    def new
        @rating = Rating.new
    end

    def create
        @rating = Rating.new(rating_params)
    
        if @rating.save
            
        end
    end

    def edit
        @rating = Rating.find(params[:id])
    end

    def update
        @rating = Rating.find(params[:id])
    
        if @rating.update(rating_params)

        end
    end

    private
    def rating_params
        params.require(:rating).permit(:rate, :post_id )
    end
end
