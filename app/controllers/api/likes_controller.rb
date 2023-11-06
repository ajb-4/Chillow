class Api::LikesController < ApplicationController

    wrap_parameters include: Like.attribute_names

before_action :require_login

def index
  @liked_homes = current_user.liked_homes
end

    def create
        @like = Like.new(like_params)

        if @like.save!
            
    end

    def destroy
    end

    private

    def like_params
        params.require(:like).permit(:liker_id, :home_id)
    end

end
