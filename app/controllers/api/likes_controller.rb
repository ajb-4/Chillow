class Api::LikesController < ApplicationController

    wrap_parameters include: Like.attribute_names + ["likerId", "homeId"]

    before_action :require_logged_in

    # def index
    #     @likes = current_user.likes
    #     render :index
    # end

    def index
        @likes = current_user.likes
        render :index
    end

    def create
        @like = Like.new(like_params)
        
        if @like.save!
            render :show
        else
            render json: {errors: @like.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def destroy
        @like = Like.find_by(id: params[:id]) 
        if @like && @like.liker_id == current_user.id && @like.destroy
            render json: {message: 'Like has been deleted.'}
        else
            render json: {errors: @like.errors.full_messages}, status: :unprocessable_entity
        end
    end

    private

    def like_params
        params.require(:like).permit(:liker_id, :home_id)
    end

end
