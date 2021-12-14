class RatingsController < ApplicationController

    def new
        @rating = Rating.new
    end

    def create
        @rating = Rating.where(admin_id: current_admin.id, post_id: params[:rating][:post_id]).first
        if @rating.present?
            @rating.update(rating_params)
        else
            @rating = Rating.new(rating_params)
            @rating.admin_id = current_admin.id
            @rating.save
        end
        @average = Rating.where(post_id: @rating.post_id).average("rate")
    end

    def edit
        @rating = Rating.find(params[:id])
    end

    def update
        
        @rating = Rating.find(params[:id])
        if @rating.update(rating_params)

        end
    end

    def destroy
        @rating = Rating.find(params[:id])
        
        if @rating.present?
            @rating.destroy 
        end
        redirect_to ratings_path
    end

    private
    def rating_params
        params.require(:rating).permit(:rate, :post_id )
    end
end
