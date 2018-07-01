class Api::V1::UsersController < Api::V1::ApiController

  include Pundit
  after_action :verify_authorized

  def create

    @user = User.where(email: params[:user][:email]).first

    if @user
      authorize([:api, :v1, @user])
      if @user.update(user_params)
        render json: @user, status: :ok
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    else
      @user = User.new(user_params)
      authorize([:api, :v1, @user])
      @user.confirmed_at = DateTime.now
      if @user.save
        render json: @user, status: :created
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end

  end

 private

    def user_params
      params.require(:user).permit(:email, component_ids: [])
    end

end
