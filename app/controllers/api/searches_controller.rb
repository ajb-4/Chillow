class Api::SearchesController < ApplicationController

    wrap_parameters include: Search.attribute_names + ['searcherId', 'homeType', 'priceMin', 'priceMax']

    def show
        @search = Search.find(params[:id])
        render :show
    end
    # where(searcher_id: current_user.id)
    def index
        @searches = Search.where(searcher_id: current_user.id)
        render :index
    end

    def create
        @search = Search.new(search_params)
        
        if @search.save
            
            render :show
        else
            render json: {errors: @search.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def update
        @search = Search.find(params[:id])

        if @search.searcher_id == current_user.id && @search.update(search_params)
            render :show
        else
            render json: {errors: @search.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def destroy
        @search = Search.find(params[:id])
        if @search.searcher_id == current_user.id && @search.destroy
            render json: {message: 'Search has been deleted.'}
        else
            render json: {errors: @search.errors.full_messages}, status: :unprocessable_entity
        end
    end

    private
    
    def search_params
        params.require(:search).permit(:price_min, :price_max, :beds, :baths, :home_type, :searcher_id)
    end
end
