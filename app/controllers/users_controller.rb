class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
    @lodgings = Lodging.where(user_id: params[:id])
    @reviews = GuestReview.where(user_id: params[:id])
  end

  def reviews
    @user = User.where(id: params[:id])
    @reviews = GuestReview.where(user: @user)
    flash.discard
  end

  # GET /users/new
  def new
    @user = User.new
  end
  # check if the params of the login form are correct
  def check_login
    check_user = User.find_by(email: params[:email])
    if check_user.present? && check_user.password == params[:password]
      session[:user_id] = check_user.id
      $logged = session[:user_id]
      flash[:notice] = "Logged successfully !"
      redirect_to root_path

    else
      flash[:alert] = "Invalid email or password !"
      redirect_to login_path
    end
  end
  # render the login form
  def login
    flash.discard
  end
  # logout using session[:user_id] cookie, and redirect to home page
  def logout
    session[:user_id] = nil
    #, notice: "Logged Out"
    redirect_to root_path
  end

  #GET
  def received_messages
    @inbox = ReceivedMessage.where("user_id = ?", session[:user_id]).map{|x| x}
    @from_users = []
    @inbox.each do |msg|
      @from_users.append(User.find_by(id: msg.from_user_id))
    end
    @inbox = @inbox.zip @from_users
  end

  # GET EDIT TWO ACCESS FROM DB
  def show_email
    @show_email_data = ReceivedMessage.find_by(id: params[:show_email_id])
    @from_user = User.find_by(id: @show_email_data.from_user_id)
    flash.discard

    # @from_current_email = params[:msg]
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        # we set the recent created user as the current connection
        session[:user_id] = @user.id
        format.html { redirect_to root_path } #, notice: "User was successfully created."
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      begin
        params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :current_role)
      rescue
      end


    end
end
