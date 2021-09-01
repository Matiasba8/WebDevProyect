class API::V1::UsersController < APIController


  def index
    users = User.all
    render json: users
  end

  def create
    user = User.new(users_params)
    if user.save
      render json: user
    else
      render json: "error"
    end
  end

  def show
    user = User.find_by(id: params[:id])
    if user
      render json: user
    else
      render json: { error: "no such user" }
    end
  end

  def update
    user = User.find_by(id: params[:id])

    if user.nil?  #user_id not found
      render json: { error: "no such user_id" }
    else
      if user.update(users_params)
        render json: user
      else # update user errors
        render json: user.errors, status: :unprocessable_entity
      end
    end
  end

  def destroy
    user = User.find_by(id: params[:id])

    if user.nil?  #user_id not found
      render json: { error: "no such user_id" }
    else
      if User.destroy(params[:id])
        render json: user
      else # update user errors
      render json: user.errors, status: :unprocessable_entity
      end
    end
  end

  def users_params
    # params.require(:user).permit(:id, :first_name,:last_name, :email, :phone_num, :user_name, :current_role, :password, :location, :bio)
    params.fetch(:user, {}).
      permit(:id,:username, :first_name,:last_name, :email, :phone_num, :user_name, :current_role, :password, :location, :bio,
             { lodgings_attributes: [:id, :user_id, :title, :description, :location, :amenities, :facilities, :equipment, :created_at, :updated_at]
             })


  end

end