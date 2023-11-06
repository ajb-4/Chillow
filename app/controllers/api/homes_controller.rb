class Api::HomesController < ApplicationController

    wrap_parameters include: Home.attribute_names
    
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

    private

    def home_params
      params.require(:home).permit(:address, :city, :state, :zipcode, :price, :bedrooms, :bathrooms, :square_feet, :lot_size, :built_date, :property_type, :unit_number, :description, :seller_id)
    end

end
