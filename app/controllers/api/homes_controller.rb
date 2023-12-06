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
    
      query[:bathrooms] = query_hash['baths'].to_f..Float::INFINITY if query_hash['baths'].length > 0
      query[:bedrooms] = query_hash['beds'].to_i..Float::INFINITY if query_hash['beds'].length > 0
      
      if query_hash['priceMin'].length > 0 && query_hash['priceMax'].length > 0
        query[:price] = query_hash['priceMin'].to_i..query_hash['priceMax'].to_i
      elsif query_hash['priceMin'].length > 0
        query[:price] = query_hash['priceMin'].to_i..Float::INFINITY
      elsif query_hash['priceMax'].length > 0
        query[:price] = 0..query_hash['priceMax'].to_i
      end
      
      conditions = []

      if query_hash['phrase'].length > 0
        phrase = query_hash['phrase'].downcase
        conditions << 'LOWER(address) LIKE :phrase OR LOWER(city) LIKE :phrase OR LOWER(state) LIKE :phrase OR LOWER(zipcode) LIKE :phrase'
      end
    
      if conditions.length > 0
        @homes = Home.where(conditions.join(' AND '), phrase: "%#{phrase}%").where(query)
      else
        @homes = Home.where(query)
      end
     
      render :search
    end    

    private

    def home_params
      params.require(:home).permit(:address, :city, :state, :zipcode, :price, :bedrooms, :bathrooms, :square_feet, :lot_size, :built_date, :property_type, :unit_number, :description, :latitude, :longitude, :seller_id)
    end

end
