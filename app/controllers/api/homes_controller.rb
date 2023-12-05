class Api::HomesController < ApplicationController

    wrap_parameters include: Home.attribute_names + ['priceMin', 'priceMax', 'homeType']
    
    def create
      @home = Home.new(home_params)

      if @home.save
        render :show
      else
        render json: {errors: @home.errors.full_messages}, status: :unprocessable_entity
      end
    end

    def show
      @home = Home.find(params[:id])
      render :show
    end

    def index
      @homes = Home.all
      render :index
    end

    def update
      @home = Home.find(params[:id])
      if @home.seller_id == current_user.id && @home.update(home_params)
        render :show
      else
        render json: {errros: @home.errors.full_messages}, status: :unprocessable_entity
      end
    end

    def destroy
      @home = Home.find(params(:id))
      @home.destroy
      render json: {message: 'Home has been delisted.'}
    end

    def search
      query_string = params[:query]
      query_hash = JSON.parse(query_string) if query_string.present?
    
      query = {}
    
      query[:bathrooms] = query_hash['baths'].to_f..Float::INFINITY if query_hash['baths'].present?
      query[:bedrooms] = query_hash['beds'].to_i..Float::INFINITY if query_hash['beds'].present?
      query[:price] = query_hash['priceMin'].to_i..query_hash['priceMax'].to_i if query_hash['priceMin'].present? && query_hash['priceMax'].present?


      @homes = Home.where(query)
     
      render :search
    end    

    private

    def home_params
      params.require(:home).permit(:address, :city, :state, :zipcode, :price, :bedrooms, :bathrooms, :square_feet, :lot_size, :built_date, :property_type, :unit_number, :description, :latitude, :longitude, :seller_id)
    end

end
