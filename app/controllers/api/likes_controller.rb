class Api::LikesController < ApplicationController

    wrap_parameters include: Like.attribute_names

    before_action :require_logged_in

    def index
        @likes = current_user.likes
        render :index
    end

    # def index
    #     @liked_homes = current_user.liked_homes
    #     render :index
    # end

    def create
        @like = Like.new(like_params)
        debugger
        if @like.save!
            render json: {message: 'Like has been created.'}
        else
            render json: {errors: @like.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def destroy
        @like = Like.find(params[:id])
        if @like.liker_id == current_user.id && @like.destroy
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
