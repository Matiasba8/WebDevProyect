class ProfileController < ApplicationController

  # GET RENDER
  def acc_settings
    @user = User.find_by(id: session[:user_id])
    flash.discard
  end

  def profile_info
    @user = User.find_by(id: session[:user_id])
    @lodgings = Lodging.where(user: @user)
    @reviews = GuestReview.where(user: @user)
    flash.discard
  end

  def profile_reserv
    @user = User.find_by(id: session[:user_id])
    @reservations = Reservation.where(user: @user)
    flash.discard
  end

  def destroy_user
    @user_destroy =  User.find_by(id: session[:user_id])
    @user_destroy.destroy
    respond_to do |format|
      format.html { redirect_to root_path}
      format.json { head :no_content }
      session[:user_id] = nil
    end
  end

  #POST
  def update_user
    @update_user = User.find_by(id: session[:user_id])
    @update_user.update(:location => params[:location],:phone_num => params[:phone_num], :bio => params[:bio])
    flash[:notice] = "Profile successfully updated!"
    redirect_to account_settings_path
  end

  #POST
  def update_password
    @update_user = User.find_by(id: session[:user_id])
    @update_user.update(:password => params[:password])
    flash[:notice] = "Password successfully updated!"
    redirect_to account_settings_path
  end

  #POST
  def update_name
    @update_user = User.find_by(id: session[:user_id])
    @update_user.update(:first_name => params[:first_name], :last_name => params[:last_name])
    flash[:notice] = "Name successfully updated!"
    redirect_to account_settings_path
  end

  # POST /
  def check_email_pass_recovery
    @user_check_email = User.find_by(:email => params[:email])
    if @user_check_email
      flash[:success] = "A message has been sent to you by email with instructions on how to reset your password."
      redirect_to recover_password_with_email_path, method: :get
    else
      flash[:warning] = "The email address you entered is not linked to a CompanyName account. You can try another email address. "
      redirect_to recover_password_with_email_path, method: :get
    end

  end

  # GET "/recover_password_with_email" RENDER
  def recover_pass_email
    flash.discard
  end


  #POST Security Questions
  def create_sq
    flash[:success] = "Successfully created security questions"
    redirect_to recover_password_with_sq_path
  end

  # GET Security Questions Template
  def new_sq
    flash.discard
  end


end
