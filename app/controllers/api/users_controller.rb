class Api::UsersController < ApplicationController
  
    wrap_parameters include: User.attribute_names + ['password']
  
    def show
      @user = User.find(params[:id])
      render :show
    end
  
    def create
      @user = User.new(user_params)
  
      if @user.save
        login!(@user)
        render :show
      else
        render json: {errors: @user.errors.full_messages}, status: :unprocessable_entity
      end
    end
  
    def update
      @user = User.find(params[:id])
      if @user.id == current_user.id && @user.update(user_params)
        render :show
      else
        render json: {errors: @user.errors.full_messages}, status: :unprocessable_entity
      end 
    end
  
    def destroy
      @user = User.find(params[:id])
      @user.destroy
      render json: {message: 'User successfully deleted,'}
    end
  
    private
  
    def user_params
      params.require(:user).permit(:username, :email, :password)
    end
end
  
